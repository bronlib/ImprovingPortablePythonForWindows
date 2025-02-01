# ImprovingPortablePythonForWindows
improving the installation of python for the PythonThemplate

One point is how the Python distribution in Windows11 is downloaded. 
It would be nicer if it went silently.

One way is shown in the batch file "large_dist.bat". In this proceeds in three steps:
1. The sought for python<version>.exe is downloaded
2. it is installed to a local directory
3. That local directory is copied to another, because during uninstall the installed directory will be removed
4. The installation is uninstalled and the install directory is removed.

Downside of this method is that the user's registry will be modified every time. This operation always has the possibility of failing and causing user's registry to be corrupted. 



