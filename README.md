perl-flexlm-commenter
=====================

Comment flexlm features that are expired

#Requirements

1. Time::Piece

#Usage

##Preview

```
./perl-flexlm-commenter license_file.lic
```

##Save changes to new lic file

```
./perl-flexlm-commenter license_file.lic > new_license_file.lic
```

#Future developement
1. specify date with option
2. select before, after or between
3. currently only comments INCREMENT lines, but needs to be expanded to also comment FEATURE line
4. reverse options to uncomment features and increments for some dates (before, after or between)
5. add comment above commented feature describing date and reason for comment
