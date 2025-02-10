INITRAMFS ?= $(DESTDIR)/etc/initramfs-tools
CONFDIR ?= $(DESTDIR)/etc/rdate-initramfs

FILES = $(INITRAMFS)/hooks/rdate $(INITRAMFS)/scripts/init-premount/rdate $(INITRAMFS)/conf-hooks.d/rdate $(CONFDIR)/rdate.conf

all:

install: $(FILES)

$(INITRAMFS)/hooks/rdate: src/hooks/rdate
	install -D $< $@

$(INITRAMFS)/scripts/init-premount/rdate: src/scripts/init-premount/rdate
	install -D $< $@

$(INITRAMFS)/conf-hooks.d/rdate: src/conf-hooks.d/rdate
	install -m0644 -D $< $@

$(CONFDIR)/rdate.conf: src/scripts/rdate.conf
	install -m0644 -D $< $@

.PHONY: uninstall
uninstall:
	$(RM) -f $(FILES)
	-rmdir $(CONFDIR)
