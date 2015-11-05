# Demo

## Update api version and redeploy
	
		# Edit api/hostname.sh
		
		m -C docker-images

		m -C ops integ
		
		m all-redeploy

## Integ -> Prod!
	
		m -C ops prod

		export MACHINE_STORAGE_PATH=/ops/machines/prod
		m tf-apply
		m all

## Scale load-balanced api

		# Edit integ override.tf

		# Edit inv prod

		m -C ops prod

		m all-redeploy
