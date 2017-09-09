# quran-kindle
Generate [Kindle](https://en.wikipedia.org/wiki/Amazon_Kindle)-friendly Quran PDFs.
Generated PDFs include Table of Contents (by part number) and no borders.

## Getting Quran page images

    Generate Quran page images using [quran.com-images](https://github.com/quran/quran.com-images).
    After generation copy the output folder to this project root directory.

## Docker installation

    docker build . -t qurankindle:v0.1

## Usage

    docker run -v /path/to/host/output:/output -e PART_FROM=1 -e PART_TO=10 qurankindle:v0.1

Omitting both `PART_FROM` and `PART_TO` or either of them defaults to 1 and 30, respectively.

The resulting PDF can be found in the host output folder named `quran.pdf`.

