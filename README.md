# English

## What is it

A simple tool to scan documents using the LINUX command line.

**imagemagick** must be installed on your system. Drivers for your scanner must be installed also!

## Usage

To get a JPEG file with the scan result:

`./scan.sh ./test.jpg`

To get a PNG file with the scan result:

`./scan.sh ./test.png`

To get a PDF file with the scan result:

`./scan.sh ./test.pdf`

## Troubleshooting

If you keep getting the error **No scanning device found**, then there is probably a problem with the access permissions to the scanner, try to run using **sudo**:

`sudo ./scan.sh ./test.jpg`

If you are trying to scan using PDF format and get the error **attempt to perform an operation not allowed by the security policy `PDF'**, then there is a problem with the PDF permissions in the imagemagic library, just run:

`sudo ./fix-pdf-permissions.sh`

# Russian

## Что это

Это простой инструмент для сканирования документов из командной строки LINUX.

**imagemagick** должен быть установлен в Вашей системе. Драйверы для сканера должны быть тоже установлены, не забудьте!

## Использование

Чтобы получить результат в виде JPEG-файла:

`./scan.sh ./test.jpg`

Чтобы получить результат в виде PNG-файла:

`./scan.sh ./test.png`

Чтобы получить результат в виде PDF-файла:

`./scan.sh ./test.pdf`

## Решение проблем

Если Вы постоянно получаете ошибку **No scanning device found**, скорее всего у Вашего пользователя нет прав доступа к сканеру, попробуйте через **sudo**:

`sudo ./scan.sh ./test.jpg`

Если Вы пытаетесь отсканировать, используя PDF-формат и видите ошибку **attempt to perform an operation not allowed by the security policy `PDF'**, это значит что **imagemagic** в целях безопасности запрещает работу с форматом PDF, для исправления запустите:

`sudo ./fix-pdf-permissions.sh`

