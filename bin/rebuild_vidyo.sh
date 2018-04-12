DEB=~/Downloads/VidyoDesktopInstaller-ubuntu64-TAG_VD_3_6_3_017.deb
OUT=~/Downloads/VidyoDesktopInstaller-ubuntu64-TAG_VD_3_6_3_017-no-libqt4-gui.deb
BUILDDIR=/tmp/vidyobuild

dpkg-deb -x $DEB $BUILDDIR
dpkg-deb --control $DEB $BUILDDIR/DEBIAN
sed -i 's/^Depends:.*/Depends: libxss1,libaudio2,libasound2,libqt4-network/' $BUILDDIR/DEBIAN/control

dpkg-deb -b $BUILDDIR $OUT

