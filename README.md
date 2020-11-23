# OHack Payir Thoorigai

Demo Video:
https://youtu.be/NlVRM6qoNZg
[![](http://img.youtube.com/vi/NlVRM6qoNZg/0.jpg)](http://www.youtube.com/watch?v=NlVRM6qoNZg "")

### Inspiration
Thoorigai is made up of a group of women that learned the skills of bag making and are using it to provide for their livelihoods. They currently handle their inventory management manually and are looking for a solution that can save time and automate some of this work. All of the members agreed that the primary inspiration came from the urge to apply their technical knowledge for a good cause that's why the name 'Social Hackers'. 
A Flutter mobile app for inventory management.

### About the App
Our mobile app helps the user manage their inventory. Some of the features include letting the user record inventory items with specifications, change the quantity, and viewing all inventory.

## Table of Context
- [About](#OHack-Payir-Thoorigai) 
- [Installation](#Installation) 
- [Features](#Features)
- [Team](#Team) 
- [Tech Stack](#Tech-Stack) 


# Installation
Steps to run this project on your local machine:

```
1. Head over to this link and install flutter: https://flutter.dev/docs/get-started/install
   The link above will walk you through installing Andriod Studio and Xcode as well

2. In your terminal and code editor: 

   - cd <directory you want to save files to>
   
   - git clone https://github.com/2020-opportunity-hack/Team-04.git

   - connect your device(Andriod, IOS, Emulator, Simulator...)

   - flutter run
```
Check out these visual tutorials for more help: 
 - [Windows](https://www.youtube.com/watch?v=Z2ugnpCQuyw)
 - [Mac](https://www.youtube.com/watch?v=hL7pkX1Pfko)
 

# Features
Developed functionality for 
- Signing up a user
- Login the user
- Create inventory item
- View items of inventory
- Update inventory item

```
1. SIGN UP

   - Start the app to see the login page
   
   - Click on the sign-up button
   
   - Enter the username and password. Password needs to be 6 characters long for a successful signup
   
   - Takes the user to the login screen after successful signup
   
   
2. LOGIN 

   - Takes in the username and password the user is registered with
   
   - Click on the login button. It will get the user to the menu screen
   
  
3. CREATE AN ITEM
    
    - Click on the 'Create Item' on the menu screen
    
    - Enter the details for the item and get to the next page where more details are asked. Make sure that the item code is not already present
    
    - Enter integers for the fields since we're not using Double datatype for the model. Refactoring the code is a future scope.
    
    - The last screen is a summary screen where the user can verify and confirm all the details you have added
    
    - Clicking on the create button will push the item to the database.
    
    
4. VIEW THE INVENTORY    
   
    - Click on the 'View All Items' on the menu screen
    
    - The view page will show item_code, quantity, sales price, and cost price. 
    
    - Shows total cost price and total sales price at the end of the screen
    

5. UPDATE THE ITEM
     
   - Click on the 'Update Item' on the menu screen
    
   - Text field for item code is red for validation purposes. It turns purple when the item code entered is valid
    
   - Increment and decrement button can be used to increment/decrement the current quantity by the entered number.
     Make sure you enter the number and then click either of the two buttons
    
   - User can update quantity, transport cost, cost price, and sales price.
     For verifying, the user can go back to the view screen and check the updated values for the same item code

```
Check out these visual tutorials for more help: 
 - [Windows](https://www.youtube.com/watch?v=Z2ugnpCQuyw)
 - [Mac](https://www.youtube.com/watch?v=hL7pkX1Pfko)

# Team

### `Malinda Lin`
- [Website](https://malinda.dev/)
- [Github](https://github.com/malinda-lin)
- [LinkedIn](https://www.linkedin.com/in/malinda-lin/)

### `Mansi Jain`
- [Github](https://github.com/supermansi)
- [LinkedIn](https://www.linkedin.com/in/jmansi/)

### `Kinnari Sanghvi`
- [Github](https://github.com/kinnarisanghvi)
- [LinkedIn](https://www.linkedin.com/in/kinnari-sanghvi/)

### `Vatsal Palan`
- [Github](https://github.com/vatsal1999)
- [LinkedIn](https://www.linkedin.com/in/vatsalpalan/)

# Tech-Stack

- [Flutter](https://flutter.dev/)
- [Firebase](https://firebase.google.com/)
