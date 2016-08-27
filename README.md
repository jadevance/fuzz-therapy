# Fuzz Therapy API

This is the Rails 5 API for [Fuzz Therapy iOS app](https://github.com/jadevance/fuzz-therapy-iOS)

Ruby Version 2.3.0

The API is configured to use the gem Paperclip to store images on S3. 

## Installation

1. `git clone git@github.com:jadevance/fuzz-therapy.git`
2. `cd fuzz-therapy`
3. `bundle install`
4. Setup an account on Amazon AWS/IAM/S3
5. You will need the following for .env parameters: 
+ AWS_ACCESS_KEY
+ AWS_SECRET_ACCESS_KEY
+ S3_BUCKET_NAME
+ AWS_REGION

## Search by UID
Search requests are POST requests to the `/api` endpoint with the
following parameters:

| parameter   | data type | description |
|-------------|----------:|-------------|
| `uid`   | string    | Search by uid |


## Search by location
Section requests are POST requests to the `/api/search` endpoint with the
following parameters(:page is optional):

| parameter   | data type | description |
|-------------|----------:|-------------|
| `location`     | string    | Geographic location entered by user |


###Example Request and Reponse
### Simple search query
Request URL:

POST:
```
https://www.fuzztherapy.com/api/search?location=Seattle
```

Response data:

```json
[
{
id: 1,
name: "Sarah",
location: "Seattle",
availability: "Mornings",
uid: "1",
created_at: "2016-08-24T20:16:04.113Z",
updated_at: "2016-08-24T20:25:20.285Z",
dog_name: "Nemesh",
dog_age: 3,
dog_breed: "Adorable",
dog_picture_file_name: "nemesh.jpg",
dog_picture_content_type: "image/jpeg",
dog_picture_file_size: 513778,
dog_picture_updated_at: "2016-08-24T20:25:20.274Z",
dog_picture_url: "http://jvance-fuzztherapy-assets.s3.amazonaws.com/users/dog_pictures/000/000/001/original/nemesh.jpg?1472070320",
email: "fuzztherapyapp@gmail.com"
},
{
id: 2,
name: "Nadine",
location: "Seattle",
availability: "Evenings",
uid: "2",
created_at: "2016-08-24T20:16:04.129Z",
updated_at: "2016-08-24T20:26:02.273Z",
dog_name: "Casper",
dog_age: 4,
dog_breed: "Fluffy",
dog_picture_file_name: "casper.jpeg",
dog_picture_content_type: "image/jpeg",
dog_picture_file_size: 1444288,
dog_picture_updated_at: "2016-08-24T20:26:02.261Z",
dog_picture_url: "http://jvance-fuzztherapy-assets.s3.amazonaws.com/users/dog_pictures/000/000/002/original/casper.jpeg?1472070362",
email: "fuzztherapyapp@gmail.com"
},
{
id: 3,
name: "Jillian",
location: "Seattle",
availability: "Mornings",
uid: "3",
created_at: "2016-08-24T20:16:04.153Z",
updated_at: "2016-08-24T20:26:15.348Z",
dog_name: "Indiana Bones",
dog_age: 5,
dog_breed: "Adorable",
dog_picture_file_name: "indy.jpg",
dog_picture_content_type: "image/jpeg",
dog_picture_file_size: 69766,
dog_picture_updated_at: "2016-08-24T20:26:15.336Z",
dog_picture_url: "http://jvance-fuzztherapy-assets.s3.amazonaws.com/users/dog_pictures/000/000/003/original/indy.jpg?1472070375",
email: "fuzztherapyapp@gmail.com"
}
]
```

### Testing
Run all tests with `rake test`
