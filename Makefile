.PHONY: check
check: check-1 check-2

export TG_LOG_LEVEL := warn

.PHONY: check-1
check-1 : clean
	@echo '---> Testing with manual stack generation'
	mise exec -- terragrunt stack generate
	mise --cd ./live/test-unit exec -- terragrunt validate

.PHONY: check-2
check-2 : clean
	@echo '---> Testing without manual stack generation'
	mise exec -- terragrunt stack clean
	mise --cd ./live/test-unit exec -- terragrunt validate

.PHONY: clean
clean:
	find . -name .terragrunt-cache -o -name terragrunt.lock.hcl -o -name .terragrunt-stack -delete
