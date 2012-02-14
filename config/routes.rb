Haderach::Application.routes.draw do
  resources :managers
  resources :words
  resources :universes
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'login' => 'user_sessions#new', :as => :login
  resources :user_sessions
  match 'paragraphs/:num/:min' => 'paragraphs#paragraph', :as => :paragraphs
  match 'paragraphs/:num' => 'paragraphs#paragraph', :as => :num_paragraphs
  match 'paragraphs' => 'paragraphs#paragraph', :as => :multiple, :num => 3
  match 'paragraph/:min' => 'paragraphs#paragraph', :as => :paragraph
  match 'paragraph' => 'paragraphs#paragraph', :as => :single_paragraph
  match 'title' => 'paragraphs#title', :as => :single_title
  match 'title/:num' => 'paragraphs#title', :as => :title
  match 'universes' => 'universes#index', :as => :univ_paragraphs
  match 'universes/:universe/paragraphs/:num/:min' => 'paragraphs#paragraph', :as => :univ_min_num_paragraphs
  match 'universes/:universe/paragraphs/:num' => 'paragraphs#paragraph', :as => :univ_num_paragraphs
  match 'universes/:universe/paragraphs' => 'paragraphs#paragraph', :as => :univ_multiple, :num => 3
  match 'universes/:universe/paragraph' => 'paragraphs#paragraph', :as => :univ_single_paragraph
  match 'universes/:universe/title' => 'paragraphs#title', :as => :univ_single_title
  match 'universes/:universe/title/:num' => 'paragraphs#title', :as => :univ_title
  resources :users
  match '/' => 'home#show'
  match ':page' => 'home#show', :as => :home, :page => /index|wordlist/
  match '*path' => redirect('/')
end
