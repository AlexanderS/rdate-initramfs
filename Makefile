INITRAMFSDIR ?= /etc/initramfs-tools
CONFDIR ?= /etc/rdate-initramfs

DEST_INITRAMFS = $(DESTDIR)/$(INITRAMFSDIR)
DEST_CONF = $(DESTDIR)/$(CONFDIR)

FILES = $(DEST_INITRAMFS)/hooks/rdate $(DEST_INITRAMFS)/scripts/init-premount/rdate $(DEST_INITRAMFS)/conf-hooks.d/rdate $(DEST_CONF)/rdate.conf

all:

install: $(FILES)

$(DEST_INITRAMFS)/hooks/rdate: src/hooks/rdate
	install -D $< $@

$(DEST_INITRAMFS)/scripts/init-premount/rdate: src/scripts/init-premount/rdate
	install -D $< $@

$(DEST_INITRAMFS)/conf-hooks.d/rdate: src/conf-hooks.d/rdate
	install -m0644 -D $< $@

$(DEST_CONF)/rdate.conf: src/scripts/rdate.conf
	install -m0644 -D $< $@

.PHONY: uninstall
uninstall:
	$(RM) -f $(FILES)
	-rmdir $(DEST_CONF)
