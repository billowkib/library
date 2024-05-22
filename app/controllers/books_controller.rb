class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :validate_user, only: %i[ update destroy create ]
  before_action :set_member, only: %i[ borrow ]

  # GET /books or /books.json
  def index
    if params[:search].present?
      @books = Book.where("title LIKE ?", "%#{Book.sanitize_sql_like(params[:search])}%")
                   .or(Book.where("author LIKE ?", "%#{Book.sanitize_sql_like(params[:search])}%"))
                   .or(Book.where("genre LIKE ?", "%#{Book.sanitize_sql_like(params[:search])}%"))
                   .or(Book.where("isbn LIKE ?", "%#{Book.sanitize_sql_like(params[:search])}%"))
                   .page(params[:page])

    else
      @books = Book.order(created_at: :desc).page(params[:page])
    end
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def borrow
    @book = Book.find(params[:book_id])

    if @member.can_borrow?(@book)
      @member.borrow!(@book)
    else
      flash[:alert] = 'Can not borrow this book again!'
    end
    redirect_to books_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_member
      if current_user.Member?
        @member = Member.find(current_user.id)
      else
        flash[:alert] = "Only members can borrow books!"
        redirect_back fallback_location: root_path
      end
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :genre, :isbn, :quantity)
    end

    def validate_user
      unless current_user && current_user.Librarian?
        flash[:alert] = 'Only librarians can perform that action!'
        redirect_back fallback_location: root_path
      end
    end
end
