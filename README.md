# ReportGarden HR Management Console

## Requirement

- Rails 5.1.1
- Ruby 2.2+

## Setup

1. Clone the repository
2. run `rake db:setup`, we will learn more about this in the session 2
3. run `rails server` to start the server
4. navigate to `0.0.0.0:3000` to view the application


## Assignment - Part I


We want to create a human resource(employee) management system where a user can see all the employees and their details. It should have the following abilities:

1. Add people(approx 10) to the list in `model/employee.rb`, We have already added one for your reference.
2. A list view to show list of all the people
3. All the names should be clickable and should take to the details view of that employee
4. The details view should show the following data:
    - Full name
    - Age
    - Designation
    - Date of joining
5. Write an helper method which is responsible for converting any given string to Title Case and use it for the full name.

Note:
Try to use the best from all the concepts covered in the session. For example amongst the multiple ways to specify routes which makes more sense to do? The solution will be evaluated on correctness and use of right techniques.

## Assignment - Part II

The HR basic app we create last day doesn't include the storage facility and is not truely dynamic. We will want to add more functionality and make it better. Let's get started.

First of all, we will remove the `Employee.rb`  model class that we have craeted before. Run the below generator command to destory the model.

```bash
rails destroy model employee
```

We will have to add the following abilities to the application:

1. The user should be able to add new employees via the app.
2. While adding a employee the user can also select which project he is currently in. (let's assume @ RG every individaul works on 1 project at a time)
3. The user should also have the ability to select a **Team Lead** for the new employee.
5. Add a view where new skills can be added
4. The user should be able to assign skills to the employee.

When we are able to create employess with selected skills, team lead and projects. We want to list employees under a team lead sorted by the number of skills they have. Here is an example:

Team Lead: Achou

Name | Skills
---- | ------
Ashrith | 6
Vamshi|5
Adil |3

> NOTE: In case two employees have the same score they should be displayed in alpahbetical order
