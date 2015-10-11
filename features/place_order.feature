Feature: Place an order for Headphones on amazon.in

#  Imperative style
  Scenario: User wants to buy new Audio Technica Headphones on Amazon India

    Given I am on the amazon.in home page
    And I type "audio technica headphones" in the search box
    When I click search
    Then I should search results for "audio technica headphones"

    When I choose the "ATH-M50X" model from the search
    Then I should see the description for my selection
    And I should also see the selling price

    When I click on add to cart button
    Then my cart should be updated with the "ATH-M50X" headphones

    When I click on "Proceed to checkout" link
    And I select a delivery address
    And I select a payment method
    Then I should see the summary of my order

    When I confirm the order
    Then I should see a confirmation page
    And I should see the delivery details
