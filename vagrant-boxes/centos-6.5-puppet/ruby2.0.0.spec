%define rubyver 2.0.0
%define rubyminorver p481

Name: ruby20
Version: %{rubyver}%{rubyminorver}
Release: 1%{?dist}
License: Ruby License/GPL - see COPYING
URL: http://www.ruby-lang.org/
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildRequires: automake zlib zlib-devel readline libyaml libyaml-devel readline-devel ncurses ncurses-devel gdbm gdbm-devel glibc-devel tcl-devel gcc unzip openssl-devel db4-devel byacc make libffi-devel
Requires: libyaml
Source0: ftp://ftp.ruby-lang.org/pub/ruby/ruby-%{rubyver}-%{rubyminorver}.tar.gz
Summary: An interpreter of object-oriented scripting language
Group: Development/Languages

%description
Ruby is the interpreted scripting language for quick and easy
object-oriented programming. It has many features to process text
files and to do system management tasks (as in Perl). It is simple,
straight-forward, and extensible.

%prep
%setup -n ruby-%{rubyver}-%{rubyminorver}

%build
export CFLAGS="$RPM_OPT_FLAGS -Wall -fno-strict-aliasing"

./configure --prefix=/usr

make %{?_smp_mflags}

%install
# installing binaries ...
make install DESTDIR=$RPM_BUILD_ROOT

#we don't want to keep the src directory
rm -rf $RPM_BUILD_ROOT/usr/src

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-, root, root)
/usr

%changelog
* Tue May 21 2013 C2S2-SAE-1.1.0.0.1 <null@null.com> ruby-2.0.0-p481-update
- Initial Version
