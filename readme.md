# SVG Shuffler

A shell script that takes an SVG file and creates a shuffled version by dividing it into tiles.

![svg-shuffle-example](https://github.com/user-attachments/assets/4b885fe1-32ee-4fea-8445-057ff364751b)


## Usage

First, make the script executable:

```bash
chmod +x shuffle.sh
```

Then run:

```bash
./shuffle.sh <input_file> <number_of_tiles>
```

### Arguments
- `input_file`: The SVG file to be shuffled
- `number_of_tiles`: The number of tiles to divide the SVG into (both horizontally and vertically)

## Process

The script performs these operations:

1. Calculates tile sizes based on input dimensions
2. Creates a temporary directory for tiles
3. Crops input SVG into tiles using vpype
4. Counts and displays created tiles
5. Shuffles tile list randomly
6. Renames tiles sequentially
7. Arranges shuffled tiles in a grid
8. Writes plot optimized SVG
9. Cleans up temporary files

The output is a new SVG file with shuffled tiles from the original image.

## Dependencies

This script requires [vpype](https://github.com/abey79/vpype) to be installed. Install it using:

```bash

pip install vpype
=======
pipx install "vpype[all]"

```


