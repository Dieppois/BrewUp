# BrewUp Website

## Description

This project is a website designed to connect beer consumers with brewers. The brewers can register, log in, and access their profiles. Each brewer has the ability to upload, edit, delete, or create beer listings. The beers are then visible on the homepage, where users can search for a specific beer using a search bar or search for a brewer. Each beer has a dedicated page that allows users to view its description, a photo, and a button to display the product's unit price.

## Features

- **User Authentication**: Brewers can sign up, log in, and manage their profiles using Devise for secure authentication.
- **Beer Management**: Brewers can add new beers, edit details of existing beers, or delete beers from their listings.
- **Homepage Display**: Beers are displayed on the homepage, and users can search for beers using a search bar or search for brewers.
- **Beer Details Page**: Each beer has a dedicated show page where users can view the description, image, and price of the beer.
- **Search Functionality**: Full-text search across the database with `pg_search`, allowing users to search for beers or brewers.
- **Image Management**: Cloudinary is used to manage and store beer images, providing easy upload and display of images.
- **Frontend Styling**: The application is styled with **Bootstrap** and **Font Awesome**, offering a responsive and visually appealing user interface with icons and components.
- **Interactive Features**: Turbo-rails and Stimulus-rails, powered by Hotwire, enable a smooth and interactive user experience without relying on complex JavaScript.

## Technologies Used

- **Backend**: Ruby, Ruby on Rails (version 7.1.5)
- **Database**: PostgreSQL
- **Frontend**: HTML, CSS, JavaScript, Bootstrap, Font Awesome
- **Authentication**: Devise for user authentication
- **Search**: pg_search for full-text search
- **Image Management**: Cloudinary for image storage and management
- **Interactivity**: Turbo-rails and Stimulus-rails with Hotwire for a dynamic user experience
