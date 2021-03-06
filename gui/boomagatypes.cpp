/* BEGIN_COMMON_COPYRIGHT_HEADER
 * (c)LGPL2+
 *
 *
 * Copyright: 2012-2013 Boomaga team https://github.com/Boomaga
 * Authors:
 *   Alexander Sokoloff <sokoloff.a@gmail.com>
 *
 * This program or library is free software; you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * END_COMMON_COPYRIGHT_HEADER */

#include "boomagatypes.h"
#include <QDebug>
#include <QDir>

/************************************************

 ************************************************/
QString duplexTypeToStr(DuplexType value)
{
    switch (value)
    {
    case DuplexAuto:          return "Auto";
    case DuplexManual:        return "Manual";
    case DuplexManualReverse: return "ManualReverse";
    }
    return "";
}


/************************************************

 ************************************************/
DuplexType strToDuplexType(const QString &str)
{
    QString s = str.toUpper();
    if (s == "AUTO")        return DuplexAuto;
    if (s == "MANUAL")      return DuplexManual;
    return DuplexManualReverse;
}


/************************************************

 ************************************************/
QString colorModeToStr(ColorMode value)
{
    switch (value)
    {
    case ColorModeAuto:         return "Auto";
    case ColorModeGrayscale:    return "Grayscale";
    case ColorModeColor:        return "Color";
    }
    return "";
}


/************************************************

 ************************************************/
ColorMode strToColorMode(const QString &str)
{
    QString s = str.toUpper();
    if (s == "GRAYSCALE")  return ColorModeGrayscale;
    if (s == "GRAY")       return ColorModeGrayscale;
    if (s == "COLOR")      return ColorModeColor;
    return ColorModeAuto;
}


/************************************************

 ************************************************/
QString safeFileName(const QString &str)
{
    QString res = str;
    res.replace('|', "-");
    res.replace('/', "-");
    res.replace('\\', "-");
    res.replace(':', "-");
    res.replace('*', "-");
    res.replace('?', "-");
    return res;
}


/************************************************

 ************************************************/
QString expandHomeDir(const QString &fileName)
{
    QString res = fileName;

    if (res.startsWith("~"))
        res.replace("~", QDir::homePath());

    return res;
}


/************************************************

 ************************************************/
QString shrinkHomeDir(const QString &fileName)
{
    QString res = fileName;

    if (res.startsWith(QDir::homePath()))
        res.replace(QDir::homePath(), "~");

    return res;

}
