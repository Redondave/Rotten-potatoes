Feature: User can add movie by searching for it in The Movie Database(TMDb)
    As a movie fan
    So that I can add new movies withou manual tedium
    I wanto to add movies by looking up their details in TMDb

    Background:
        Given I am on the RottenPotatoes home page
        Then I should see "Search TMDb for a movie"

        Scenario: Try to add a nonexistent movie (sad path)
            When I fill in "search_terms" with "Movie That Does Not Exist"
            And I press "Search TMDb"
            Then I should be on the RottenPotatoes home page
            And I should see "'Movie That Does Not Exist' was not found on TMDb"
        
        Scenario: Add a movie that exists (happy path)
            When I fill in "search_terms" with "Inception"
            And I press "Search TMDb"
            Then I should be on the RottenPotatoes home page
            And I should see "Inception"