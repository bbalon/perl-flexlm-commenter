perl-flexlm-commenter
=====================

Comment flexlm features that are expired

#Requirements

1. Time::Piece

#Usage

##Preview

```
./perl-flexlm-commenter license_file.lic [-d %e-%b-%Y] [-b|-a]
```

Options:
  -d date | --date=date - enter own date (default is today)
  -b | --before - will comment features before date specified (default is only today)
  -a | --after - will comment features after date specified (default is only today)

##Examples
Comment out features expired before today
```
./perl-flexlm-commenter license_file.lic -b
```
Comment out features after 24-apr-2015
```
./perl-flexlm-commenter license_file.lic -d 24-apr-2015 -a
```

##Save changes to new lic file
```
./perl-flexlm-commenter license_file.lic [options] > new_license_file.lic
```

#Future development
1. comment between two dates or specify multiple dates to comment
2. currently only comments INCREMENT lines, but needs to be expanded to also comment FEATURE line
3. reverse options to uncomment features and increments for some dates (before, after or between)
4. add comment above commented feature describing date and reason for comment
