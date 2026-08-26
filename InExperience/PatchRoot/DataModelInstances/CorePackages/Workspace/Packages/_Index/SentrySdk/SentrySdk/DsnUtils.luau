local versionModule = require(script.Parent.Version)

return {
	parse_dsn = function(p1)
		if not p1 or p1 == "" then
			return nil, "DSN is required"
		end
		local var1, var2, var3 = p1:match("^(https?)://([^@]+)@(.+)$")
		
		if not var1 or not var2 or not var3 then
			return nil, "Invalid DSN format"
		end
		local var4, var5 = var2:match("^([^:]+):(.+)$")
		
		if not var4 then
			var4 = var2
			var5 = ""
		end
		if not var4 or var4 == "" then
			return nil, "Invalid DSN format"
		end
		local var6, var7 = var3:match("^([^/]+)(.*)$")
		
		if not var6 or not var7 or var7 == "" then
			return nil, "Invalid DSN format"
		end
		local var8 = var7:match("/([%d]+)$")
		
		if var8 then
			return {
				protocol = var1,
				public_key = var4,
				secret_key = var5 or "",
				host = var6,
				path = var7,
				project_id = var8
			}, nil
		end
		return nil, "Could not extract project ID from DSN"
	end,
	build_ingest_url = function(p1)
		return `https://{p1.host}/api/{p1.project_id}/store/`
	end,
	build_envelope_url = function(p1)
		return `https://{p1.host}/api/{p1.project_id}/envelope/`
	end,
	build_auth_header = function(p1)
		-- upvalues: versionModule (ref)
		return `Sentry sentry_version={versionModule.SENTRY_VERSION}, sentry_key={p1.public_key}, sentry_client=sentry-lua/{versionModule.SDK_VERSION}`
	end
}