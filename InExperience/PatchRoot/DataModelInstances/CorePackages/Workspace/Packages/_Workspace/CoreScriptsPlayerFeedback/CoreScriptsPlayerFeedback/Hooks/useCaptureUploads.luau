local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local reactModule = require(coreScriptsPlayerFeedback.Parent.React)
local _ = require(coreScriptsPlayerFeedback.CaptureTypes)
local getCaptureKeyModule = require(coreScriptsPlayerFeedback.Utils.getCaptureKey)
local uploadCaptureAssetModule = require(coreScriptsPlayerFeedback.Utils.uploadCaptureAsset)

return function() --[[ line: 25 | named "useCaptureUploads" ]]
	-- upvalues: reactModule (ref), getCaptureKeyModule (ref), uploadCaptureAssetModule (ref)
	local var4, var5 = reactModule.useState({})
	local var6 = reactModule.useRef({})
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useRef(0)
	
	return {
		uploadStatuses = var4,
		anyUploading = reactModule.useMemo(function() --[[ line: 34 ]]
			-- upvalues: var4 (ref)
			for i, v in var4 do
				if v.status == "uploading" then
					return true
				end
			end
			return false
		end, { var4 }),
		hasNonModerationFailure = reactModule.useMemo(function() --[[ line: 43 ]]
			-- upvalues: var4 (ref)
			for i, v in var4 do
				if v.status == "failed" and v.failureReason ~= Enum.UploadCaptureResult.CaptureModerated then
					return true
				end
			end
			return false
		end, { var4 }),
		onCapturesAdded = reactModule.useCallback(function(p0) --[[ line: 54 ]]
			-- upvalues: getCaptureKeyModule (copy), var4 (ref), var5 (ref), var6 (ref), var7 (ref), var8 (ref), uploadCaptureAssetModule (copy)
			local t = {}
			
			for i, v in p0 do
				t[getCaptureKeyModule(v)] = v
			end
			local t_1 = {}
			
			for i_1, v_1 in t do
				if var4[i_1] == nil then
					table.insert(t_1, v_1)
				end
			end
			var5(function(p1) --[[ line: 68 ]]
				-- upvalues: t (ref), t_1 (ref), getCaptureKeyModule (copy), var6 (copy)
				local t_2 = {}
				
				for i, v in p1 do
					if t[i] then
						t_2[i] = v
					end
				end
				local var13 = 0
				
				for i_1, v_1 in p1 do
					if v_1.order and var13 < v_1.order then
						var13 = v_1.order
					end
				end
				for i_2, v_2 in t_1 do
					var13 += 1
					local var14 = getCaptureKeyModule(v_2)
					local var15 = var6.current[var14]
					
					if var15 then
						t_2[var14] = {
							capture = v_2,
							status = var15.status,
							assetId = var15.assetId,
							failureReason = var15.failureReason,
							order = var13
						}
					else
						t_2[var14] = {
							status = "uploading",
							assetId = nil,
							capture = v_2,
							order = var13
						}
					end
				end
				return t_2
			end)
			
			for i_2, v_2 in t_1 do
				local var11 = getCaptureKeyModule(v_2)
				
				if not var6.current[var11] and not var7.current[var11] then
					var8.current += 1
					local current = var8.current
					var7.current[var11] = current
					task.spawn(function() --[[ line: 108 ]]
						-- upvalues: uploadCaptureAssetModule (copy), v_2 (ref), var7 (copy), var11 (ref), current (ref), var6 (copy), var5 (copy)
						local var16, var17 = uploadCaptureAssetModule(v_2)
						
						if var7.current[var11] ~= current then return end
						var7.current[var11] = nil
						local t = {
							order = nil,
							capture = v_2,
							status = if var16 ~= nil then "failed" else "succeeded",
							failureReason = var17,
							assetId = var16
						}
						
						if if var16 == nil then var17 == Enum.UploadCaptureResult.CaptureModerated else true then
							var6.current[var11] = t
						end
						var5(function(p2) --[[ line: 125 ]]
							-- upvalues: var11 (copy), v_2 (copy), t (ref)
							if p2[var11] then
								local cloned = table.clone(p2)
								cloned[var11] = {
									capture = v_2,
									status = t.status,
									failureReason = t.failureReason,
									assetId = t.assetId,
									order = p2[var11] and p2[var11].order
								}
								
								return cloned
							end
							return p2
						end)
					end)
				end
			end
		end, { var4 }),
		onCaptureRemoved = reactModule.useCallback(function(p3) --[[ line: 143 ]]
			-- upvalues: var5 (ref)
			var5(function(p4) --[[ line: 144 ]]
				-- upvalues: p3 (ref)
				local cloned = table.clone(p4)
				cloned[p3] = nil
				
				return cloned
			end)
		end, {})
	}
end