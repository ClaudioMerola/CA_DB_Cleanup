# CA_DB_Cleanup
This is a Powershell script to cleanup very large Microsoft CA Databases.

The way it works is by getting all the Request IDs between specific dates, then the script split the Request IDs into chunks of 50.000 records and creates one powershell process (one job) for each chunk. 

This way the cleanup should be alot faster. 

But be aware that it is way heavier for the CPU and memory of the server!

