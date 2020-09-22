# perl-base

Base Docker images for perl applications.

- [Supported images](#supported-images)
- [Image properties](#image-properties)
- [Sample use](#sample-use)
- [Licence](#license)

## Supported images

| Tag                                                                  | OS         | Perl version |
| ---------------------------------------------------------------------| ---------- | ------------ |
| `169942020521.dkr.ecr.eu-west-1.amazonaws.com/base/perl:5.18-centos` | Centos 7.x | 5.18.2       |

## Image properties

Here are the properties used in the base images:

| Directive | Value                                                                    |
| --------- | ------------------------------------------------------------------------ |
| `WORKDIR` | `/app`                                                                   |
| `CMD`     | `sh -c PERL5LIB=local/lib/perl5 plenv exec perl script/start_app daemon` |

## Sample use

Follow below steps to package perl application as a Docker image: 

1. create `.dockeringore` file to filter out files that should not be copied to Docker image

2. create `Dockerfile` file with instructions below and adjust port number to one application uses:

   ```dockerfile
    FROM 169942020521.dkr.ecr.eu-west-1.amazonaws.com/base/perl:5.18-centos

    ENV MOJO_LISTEN=http://*:9999

    EXPOSE 9999
    ```
  
3. build Docker image using `docker build -t 169942020521.dkr.ecr.eu-west-1.amazonaws.com/local/[application name] .` command

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
