# Lesson 08

## Ethereum Wallet

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
<!-- ALL-CONTRIBUTORS-BADGE:END -->

Before jumping into the Dapp code you need to setup an Ethereum wallet.
There are bunch of wallet applications and types outher, but for this project we're going to use Metamask.

### What is an ethereum Wallet

A wallet is an application that let's you interact with your Ethereum account. You're wallet is the one that works as a gate between the Dapp and your data, through it the applications can read your balance, send transactions, etc.

You can swap wallet providers at any time or manage multiple accounts in one application. This is because the wallet are non-custodial, meaning that they don't hold your assets, you do.

Just to set some concepts down:

- An Ethereum account is an "entity" that can send transactions and store some assets, it "lives" inside the blockchain.
- The accout have an address (like your profile URL of some social app or your email address) that can be used to send or receive funds.
- A wallt is an application that allow you to interact with the Ethereum account.

There are different types of Wallets:

- Hardware wallets that hold your crypto assets offline - The most secure of all
- Mobile apps, like Argent.
- Web wallets, that let you interact through the browser: Like Metamask.
- Desktp apps

### Setting up Metamask

As mentioned before, for this project you'll use Metmask. It will help you to handle the accounts and connecting your current user to the blockchain.
So go ahead and download the browser [extension from here](https://metamask.io/download/) and setup and account.

For now you'll interact with your local network and for that your account will need some funds. To accomplish this you can import the accounts generated by the local network script and use the fake Eth associated to them

To do so, first open Metamask and enable the use of **test networks** this will update the Metamask UI and willa llow you to choose `Localhost 8545` as network to connect.

![](./lessons-assets/metamask-01.png)
![](./lessons-assets/metamask-03.png)
![](./lessons-assets/metamask-03.png)

Next, change the network by choosing `Localhost 8545`

![](./lessons-assets/metamask-04.png)

Now, is time to import some accounts, go to the menu an choose **Import Account**, there you can copy and paste one of the **Private Keys** logged in the console that is running the local network.
You'll import two accounts:

- The first one logged out that represents the owner of the contract.
- Any other account that will be used as a user that want to send a Tip.

![](./lessons-assets/metamask-05.png)
![](./lessons-assets/metamask-06.png)

Now your accounts are ready to use, is time for some Svelte!
