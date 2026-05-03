Feature: User can view a list of all movies
    As a movie fan
    So that I can see all the movies in my collection
    I want to be able to view a list of all movies

    Background:
        Given I am on the RottenPotatoes home page
        Then I should see "All Movies"

    Scenario: View the list of movies
        Given I am on the RottenPotatoes home page
        When I follow "Add movie"
        Then I should be on the Create New Movie page
        When I fill in "Title" with "Zorro"
        And I select "PG" from "Rating"
        And I press "Save Changes"
        Then I should be on the RottenPotatoes home page
        When I follow "Add movie"
        Then I should be on the Create New Movie page
        When I fill in "Title" with "Apocalypse Now"
        And I select "R" from "Rating"
        And I press "Save Changes"
        When I follow "Movie Title"
        Then I should see "Apocalypse Now" before "Zorro"