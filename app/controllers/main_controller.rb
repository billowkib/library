class MainController < ApplicationController
  before_action :set_member_or_librarian

  def index
    @books = Book.order(created_at: :desc).page(params[:page])
    @due_today = BookBorrow.due_today
  end

  def return_book
    @member = Member.find(params[:user_id])
    @book = Book.find(params[:book_id])
    @librarian.return_book!(@member, @book)
    redirect_to root_path
  end

  private
    def set_member_or_librarian
      return unless current_user

      if current_user.Librarian?
        @librarian = Librarian.find(current_user.id)
      else
        @member = Member.find(current_user.id)
      end
    end
end
