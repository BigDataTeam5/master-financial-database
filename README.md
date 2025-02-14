# master-financial-database

This repository contains the end-to-end solution for building a master financial statement database for US public companies. The project supports fundamental analysis by using SEC financial statement data sets and encompasses several components including data scraping, storage design, validation, Airflow pipelines for ETL processes, and deployed applications for data access via Streamlit and FastAPI.

## Workflow Diagram

Below is the workflow diagram for the AI Application:


![alt text](image.png)
### Diagram Description:
1. **User**: The end-user interacts with the application via the Streamlit frontend.
2. **Streamlit App**: The frontend built using Streamlit.
3. **FastAPI Backend**: The backend server that handles data processing.
4. **Data Extraction**:
   - **Python**: For extracting multiple zips from SEC website.
5. **AWS S3 Bucket**: Used for storing raw unprocessed data.
6. **Snowflake**: Used for storing json and rdbms data.
7. **Google Cloud Run**: Used for Deploying FastAPI applications
8. **Streamlit In-builtDeployment**: Used for Deploying Streamlit application for UI/UX.
9. **Streamlit Application URL**: http://34.56.233.252:8501/.
10. **Airflow Application URL**: http://34.56.233.252:8080/login/?next=http%3A%2F%2F34.56.233.252%3A8080%2Fhome.
11. **Google CodeLabs URL**: https://codelabs-preview.appspot.com/?file_id=1tVv4J83L46ZG3zxy8CkdNmQFbEnVXTgbeXhP5TdlYJ0#0
12. **Project_Brief_Video**: https://teams.microsoft.com/l/meetingrecap?driveId=b%21FayNqOa36EqT25ce1C895cHOMeHKQoJHgOYzg_brHsgUmPc9DOTzRZxUhXvmml6L&driveItemId=01I6MVIPIVNFJLDNZ5PNEISEIFJIHAC2HZ&sitePath=https%3A%2F%2Fnortheastern-my.sharepoint.com%2F%3Av%3A%2Fg%2Fpersonal%2Fmate_r_northeastern_edu%2FERVpUrG3PXtIiREFSg4BaPkBJy8QEIC4uqOi_5xpJqXhZw&fileUrl=https%3A%2F%2Fnortheastern-my.sharepoint.com%2F%3Av%3A%2Fg%2Fpersonal%2Fmate_r_northeastern_edu%2FERVpUrG3PXtIiREFSg4BaPkBJy8QEIC4uqOi_5xpJqXhZw&iCalUid=040000008200e00074c5b7101a82e00800000000b7a5a34d6a6fdb010000000000000000100000001e7bfd83f44da9448a1dbbab193014f7&threadId=19%3Ameeting_MzlkMDNhNGItOWJjMi00Mjk3LThmOTUtN2FlMzRhYzdiOGZi%40thread.v2&organizerId=aa87e9b3-28f3-4532-93b8-06c36bf6da04&tenantId=a8eec281-aaa3-4dae-ac9b-9a398b9215e7&callId=4fb55145-7ea6-46ed-8e2d-c76fee86de98&threadType=Meeting&meetingType=Scheduled&subType=RecapSharingLink_RecapChiclet 


## Prerequisites

- Python 3.7+
- [Diagrams](https://diagrams.mingrammer.com/) library for generating the workflow diagram.
- AWS account with S3 bucket access.
- Streamlit and FastAPI installed for frontend and backend development.
- Install [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- Install [Docker](https://docs.docker.com/get-docker/) 

