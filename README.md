perl-flexlm-commenter
=====================

Comment flexlm features that are expired

#Requirements

1. Time::Piece

#Usage

##Preview

```
./perl-flexlm-commenter license_file.lic [-d %e-%b-%Y] [-b|-a] [-c]
```
```
Options:
  -d date | --date=date - enter own date (default is today) - format needs to be %e-%b-%Y (12-apr-2015); same as in lic files
  -b | --before - will comment features before date specified (default is only today)
  -a | --after - will comment features after date specified (default is only today)
  -c "comment" | --comment "comment" - specify comment that will be added above comented section (default: "Commented $date - by perl-flexlm-commenter"
```
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
- [x] specify date in commend line (defaults to today if not specified)
- [x] before (will commend features before date specified)
- [x] after (will comment features after date specified; if before is specified, before wil be taken)
- [x] add comment above commented feature describing date and reason for comment
- [ ] reverse options to uncomment features and increments for some dates (before, after or between)
- [ ] specify list of features want to comment or uncomment
- [ ] comment between two dates or specify multiple dates to comment
