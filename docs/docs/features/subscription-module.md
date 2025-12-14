---
sidebar_position: 36
---
# Subscription Module

**NOTE:** Please be aware that both commission and subscription modules are integrated within a single earnings module for the admin. For a comprehensive understanding of how this module functions, please refer to the points outlined below.

- Admins can create subscriptions from the admin panel with commissions and some limitations.
- If the admin wants to create only a commission-based subscription, then he can add 0 as the price and also add some limitations, as shown in the below image

![Add Subscription](../../static/img/adminPanel/add_subscription.webp)

- **Publish:** If it is activated, then the provider will be able to show the subscriptions, and if it is deactivated, then only the administrator can show it and assign it to the provider
- **Duration:** if the admin wants to create it for limited days, he can choose the limited option; otherwise, unlimited days will be shown
- **Order:** if the admin wants to create a subscription to allow only 100 orders, then the admin can make this subscription like this, and if the order limit has been accessed, then the subscription will be expired and the provider has to buy the subscription again
- **Commission:** if the admin also wants commission on subscriptions, he can set percentages as well
  - **Threshold:** this will be applicable to the pay-on-delivery amount commission if the threshold is set at $500, and if the pay-on-delivery commission exceeds that value, the pay-on-delivery option will be discontinued for the provider while booking the service, and the customer will only be able to book as prepaid service
  - **Percentage:** How much commission admin wants from the provider
- If the provider does not have an active subscription, it will not be shown to the customer
- In the provider app/panel, the provider can see subscription history, active subscriptions, and if the subscription is not active, the option to buy the subscription
- Subscription Flow for the New Provider:
  - Providers verify their numbers and add basic details such as passwords, names, etc.
  - Then, after a provider has to login with a number and password, it will be able to fill in the other details of the business, like KYC details
  - Once the provider is approved, he will be allowed to buy the subscription, and then after he will be able to access the application's

![Provider Buy Subscription](../../static/img/adminPanel/provider_buy_supscription.webp)

- Admins can also assign subscriptions to new providers or subscriptions that the Provider has not purchased

![Assign Subscription](../../static/img/adminPanel/assign_subscription.webp)

**NOTE:** The Provider panel currently features an integrated Stripe payment gateway for subscription payments. We will be implementing additional payment gateways in the upcoming update. Additionally, the Provider application includes integration with Stripe, Razorpay, and Paystack for subscription payments. 