local VersionModule = require(script.Parent.Version)

return {
	parse_dsn = function(p1)
		if not p1 or p1 == "" then
			return nil, "DSN is required"
		end
		local Protocol, v1, v2 = p1:match("^(https?)://([^@]+)@(.+)$")
		
		if not Protocol or not v1 or not v2 then
			return nil, "Invalid DSN format"
		end
		local Public_key, v3 = v1:match("^([^:]+):(.+)$")
		
		if not Public_key then
			Public_key = v1
			v3 = ""
		end
		if not Public_key or Public_key == "" then
			return nil, "Invalid DSN format"
		end
		local Host, Path = v2:match("^([^/]+)(.*)$")
		
		if not Host or not Path or Path == "" then
			return nil, "Invalid DSN format"
		end
		local D = Path:match("/([%d]+)$")
		
		if D then
			return {
				protocol = Protocol,
				public_key = Public_key,
				secret_key = v3 or "",
				host = Host,
				path = Path,
				project_id = D
			}, nil
		else
			return nil, "Could not extract project ID from DSN"
		end
	end,
	build_ingest_url = function(p1): string
		return `https://{p1.host}/api/{p1.project_id}/store/`
	end,
	build_envelope_url = function(p1): string
		return `https://{p1.host}/api/{p1.project_id}/envelope/`
	end,
	build_auth_header = function(p1): string
		-- upvalues: VersionModule (copy)
		return `Sentry sentry_version={VersionModule.SENTRY_VERSION}, sentry_key={p1.public_key}, sentry_client=sentry-lua/{VersionModule.SDK_VERSION}`
	end
}