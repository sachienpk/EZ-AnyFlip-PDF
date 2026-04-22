# EZ-AnyFlip-PDF

A lightweight, **zero-dependency** Windows Batch script to download AnyFlip books and convert them into high-quality PDFs. 

Unlike other downloaders, **EZ-AnyFlip-PDF** doesn't require Python, Node.js, or any external libraries. It leverages the tools already built into Windows (cURL and Microsoft Edge) to get the job done.

## ✨ Features
* **Zero Install:** No need to install Python or extra software.
* **High Quality:** Downloads original `.webp` images directly from the source.
* **Native Conversion:** Uses Microsoft Edge's headless engine to "print" a perfect PDF.
* **Fast & Clean:** Automatically cleans up temporary image files after the PDF is created.

## 🚀 How to Use

1.  **Download** the `anyflip_downloader.bat` file from this repository.
2.  **Run** the script by double-clicking it.
3.  **Paste** your AnyFlip link (e.g., `https://anyflip.com/pnuoe/fdth/basic`).
4.  **Enter** the desired name for your PDF.
5.  **Done!** Your PDF will appear in the same folder as the script.

## 🛠️ How it Works
This script uses a "hybrid" approach to stay lightweight:
* **cURL:** Used to sequentially download pages until the book ends.
* **Batch Logic:** Handles URL parsing and automated incrementing of page numbers.
* **Headless Edge:** The script generates a temporary HTML "map" of the images and commands Microsoft Edge to render and print it to a PDF in the background.

## 📋 Requirements
* **Windows 10 or 11**
* **Microsoft Edge** (Standard on Windows)

## ⚠️ Disclaimer
This tool is intended for **educational purposes and personal use only**. Please respect the copyright of the content creators and use this tool only on documents you have the right to access or for which you have permission from the owner. The developer is not responsible for any misuse of this tool.

## ⚖️ License
This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---
*Created with 💡 by [sachienpk](https://github.com/sachienpk)*
