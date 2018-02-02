# aws-ml-regression

Lab to illustrate using Amazon Machine Learning regression models to predict flight arrival time delays. One model is made for long-term forecasts and one for near-term forecasts.

![Lab Environment](https://user-images.githubusercontent.com/3911650/35749850-2efdaa4a-0810-11e8-8bc5-16efbe10f4c1.png)

## Getting Started

Deploy the CloudFormation stack in the template in `infrastructure/`. The template creates a user with the following credentials and minimal required permisisons to complete the Lab:

- Username: _student_
- Password: _password_

## Instructions

- Get the URL of the CSV data file automatically uploaded to S3
- In the Amazon ML Console, launch the standard setup wizard to:
    - Create a datasource from the CSV file in S3, it will automatically configure the datasource with settings in the `.schema` file in the `data/` directory
    - Create a model with custom settings values
        - Use the custom recipe in `data/recipe-no-departures.json` to create a long-term forecast model (it doesn't use any actual departure time attributes)
        - Retain default values except set the shuffling to None (the data is pre-shuffled and will give a fair comparison between models)
    - Create an evaluation with default values
- Create a new model with the same settings as the previous model but use the `data/recipe-with-departures.json` recipe to create a near-term model that uses actual departure time attributes
- Inspect the datasource and evaluation statistics
- Perform a real-time prediction with each model by pasting in the following record: `2018,1,2,1,4,"AA","N795AA","12","SFO","JFK","1142","1135",-7,0,0,-1,"2030",0,288,2586,11`
    - The actual flight arrival delay was -34 minutes (34 minutes early)

## Cleaning Up

In the Amazon ML Console, delete the datasource, model, and evaluation. Delete the CloudFormation stack to remove all the remaining template resources.

## Acknowledgements

Thanks to the US Department of Transportation Bureau of Transportation Statistics for providing the Airline On-Time Performance data.