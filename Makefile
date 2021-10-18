install:
	for file in scripts/*; do \
	  echo "Run $${file}"; \
		bash $${file}; \
	done
