# gem install ffi

```bash
➜  customized_rails_recipes git:(master) ✗ sudo gem install ffi -v '1.9.18'
Building native extensions. This could take a while...
ERROR:  Error installing ffi:
	ERROR: Failed to build gem native extension.

    current directory: /Users/chanweiyan/.rvm/rubies/ruby-2.6.6/lib/ruby/gems/2.6.0/gems/ffi-1.9.18/ext/ffi_c
/Users/chanweiyan/.rvm/rubies/ruby-2.6.6/bin/ruby -I /Users/chanweiyan/.rvm/rubies/ruby-2.6.6/lib/ruby/site_ruby/2.6.0 -r ./siteconf20210201-90052-1bqp53l.rb extconf.rb
checking for ffi_call() in -lffi... yes
checking for ffi_prep_closure()... yes
checking for ffi_raw_call()... yes
checking for ffi_prep_raw_closure()... yes
checking for shlwapi.h... no
checking for rb_thread_blocking_region()... no
checking for rb_thread_call_with_gvl()... yes
checking for rb_thread_call_without_gvl()... yes
checking for ffi_prep_cif_var()... yes
creating extconf.h
creating Makefile

current directory: /Users/chanweiyan/.rvm/rubies/ruby-2.6.6/lib/ruby/gems/2.6.0/gems/ffi-1.9.18/ext/ffi_c
make "DESTDIR=" clean

current directory: /Users/chanweiyan/.rvm/rubies/ruby-2.6.6/lib/ruby/gems/2.6.0/gems/ffi-1.9.18/ext/ffi_c
make "DESTDIR="
compiling AbstractMemory.c
compiling ArrayType.c
compiling Buffer.c
compiling Call.c
Call.c:355:5: error: implicit declaration of function 'rb_thread_call_without_gvl' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    rbffi_thread_blocking_region(call_blocking_function, data, (void *) -1, NULL);
    ^
./Thread.h:78:39: note: expanded from macro 'rbffi_thread_blocking_region'
# define rbffi_thread_blocking_region rb_thread_call_without_gvl
                                      ^
1 error generated.
make: *** [Call.o] Error 1

make failed, exit code 2

Gem files will remain installed in /Users/chanweiyan/.rvm/rubies/ruby-2.6.6/lib/ruby/gems/2.6.0/gems/ffi-1.9.18 for inspection.
Results logged to /Users/chanweiyan/.rvm/rubies/ruby-2.6.6/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-20/2.6.0/ffi-1.9.18/gem_make.out

```

sudo gem install ffi -v '1.9.18' -- --with-cflags="-Wno-error=implicit-function-declaration"

<https://stackoverflow.com/questions/64098041/cant-install-ffi-v-1-9-18-on-macos-catalina>
