# README

inp file processing.

The following is a list of limitations I am aware of and improvements I would like to make.

* **Job Processing** `perform_now` was used instead of `perform_later` on jobs that should be delayed (file processing and email sending). I do not have sidekiq/redis setup on my development environment
* **File Parsing** The solution uses a library class, inpImporter. This will parse the inp file and process it as key value pairs. The library could be developed externally to the rails app and possibly exported to a gem if required by other projects.
* **Database Structure** A full database structure has not been implemented. Only one model / table has been used. It is not clear to me what the different use cases for the data is, so I haven't split it into tables. I would expect that each building has an associated compliance record, etc with a one-to-one relationship, and this would be my next plan.
* **Data types** A number of fields from the inp files are options that can be selected from a list - for example B-TYPE. I would consider using enums in this situation rather than storing the strings in the database.
* **Tests** I have not implemented any test suite for this code.
* **Style** There is no front end styling at all done on this.
* **Validation** There is no validation of file types or email addresses being uploaded.