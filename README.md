# README

# Problem 1
 Given a list of strings, and integer, i
 find all strings less then length i, then group
 and count the number of strings by their length

 example:
 strings = [ 'abc', 'defg', 'hi' ,'a', 'b', 'ze', 'ae' ]
 i = 4

 output = { 1: 2, 2: 3, 3: 1 }

def filter_and_group(strings, i)
end

# Solution File
app/helpers/stringHelper.rb
function : filter_and_group

# Sample
 call to the function in Rails console
 
    strings = ['abc', 'defg', 'hi', 'a', 'b', 'ze', 'ae']
 
    i = 4
    result = filter_and_group(strings, i)
    puts result

#Problem 2

- Decided to create a new controller to be the mediator between the model and the view, since it is not correct to call a model directly from the view.
- To avoid repeating code I decided to make a layout and call it from wherever necessary

#Problem 3

The main danger of this code is the possibility of an N+1 query problem, which can lead to inefficient database queries, especially when displaying many reviews for a single book. In other words, for every review of a book, a separate query is sent to the database to retrieve the user who wrote the review. This can slow down the application and make it inefficient.

To fix this, we can use eager loading to retrieve all the user data in a single query. We can modify the Book class to include the User association using the "includes" method like this:

    class Book < ActiveRecord::Record
     has_many :reviews, include: :user
    end

Then, in the view, we can modify the code to use the "each" loop with a block that calls the associated user data for each review. This will allow us to avoid the N+1 query problem, and retrieve all the necessary data in a single query. The updated code would look like this:

    @book = Book.includes(:reviews => :user).find(1)
    @book.reviews.each do |review|
      <%= review.content.html_safe %> by <%= review.user.full_name %>
    end

This code will retrieve all the reviews and the associated user data in a single query, which is much more efficient than sending multiple queries for each review.