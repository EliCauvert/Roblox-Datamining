local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local reactModule = require(coreScriptsPlayerFeedback.Parent.React)
local _ = require(coreScriptsPlayerFeedback.CaptureTypes)
local getCaptureKeyModule = require(coreScriptsPlayerFeedback.Utils.getCaptureKey)
local uploadCaptureAssetModule = require(coreScriptsPlayerFeedback.Utils.uploadCaptureAsset)

return function()
	-- upvalues: reactModule (ref), getCaptureKeyModule (ref), uploadCaptureAssetModule (ref)
	local var1, var2 = reactModule.useState({})
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useRef(0)
	
	return {
		uploadStatuses = var1,
		anyUploading = reactModule.useMemo(function()
			-- upvalues: var1 (ref)
			for i, v in var1 do
				if v.status == "uploading" then
					return true
				end
			end
			return false
		end, { var1 }),
		hasNonModerationFailure = reactModule.useMemo(function()
			-- upvalues: var1 (ref)
			for i, v in var1 do
				if v.status == "failed" and v.failureReason ~= Enum.UploadCaptureResult.CaptureModerated then
					return true
				end
			end
			return false
		end, { var1 }),
		onCapturesAdded = reactModule.useCallback(function(p1)
			-- upvalues: getCaptureKeyModule (copy), var1 (ref), var2 (ref), var3 (ref), var4 (ref), var5 (ref), uploadCaptureAssetModule (copy)
			local t = {}
			
			for i, v in p1 do
				t[getCaptureKeyModule(v)] = v
			end
			local t_1 = {}
			
			for i_1, v_1 in t do
				if var1[i_1] == nil then
					table.insert(t_1, v_1)
				end
			end
			var2(function(p2)
				-- upvalues: t (ref), t_1 (ref), getCaptureKeyModule (copy), var3 (copy)
				local t_2 = {}
				
				for i, v in p2 do
					if t[i] then
						t_2[i] = v
					end
				end
				local var6 = 0
				
				for i_1, v_1 in p2 do
					if v_1.order and var6 < v_1.order then
						var6 = v_1.order
					end
				end
				for i_2, v_2 in t_1 do
					var6 += 1
					local var7 = getCaptureKeyModule(v_2)
					local var8 = var3.current[var7]
					
					if var8 then
						t_2[var7] = {
							capture = v_2,
							status = var8.status,
							assetId = var8.assetId,
							failureReason = var8.failureReason,
							order = var6
						}
					else
						t_2[var7] = {
							status = "uploading",
							assetId = nil,
							capture = v_2,
							order = var6
						}
					end
				end
				return t_2
			end)
			
			for i_2, v_2 in t_1 do
				local var9 = getCaptureKeyModule(v_2)
				
				if not var3.current[var9] and not var4.current[var9] then
					var5.current += 1
					local current = var5.current
					var4.current[var9] = current
					task.spawn(function()
						-- upvalues: uploadCaptureAssetModule (copy), v_2 (ref), var4 (copy), var9 (ref), current (ref), var3 (copy), var2 (copy)
						local var10, var11 = uploadCaptureAssetModule(v_2)
						
						if var4.current[var9] ~= current then return end
						var4.current[var9] = nil
						local t = {
							order = nil,
							capture = v_2,
							status = if var10 ~= nil then "failed" else "succeeded",
							failureReason = var11,
							assetId = var10
						}
						
						if if var10 == nil then var11 == Enum.UploadCaptureResult.CaptureModerated else true then
							var3.current[var9] = t
						end
						var2(function(p3)
							-- upvalues: var9 (copy), v_2 (copy), t (ref)
							if p3[var9] then
								local cloned = table.clone(p3)
								cloned[var9] = {
									capture = v_2,
									status = t.status,
									failureReason = t.failureReason,
									assetId = t.assetId,
									order = p3[var9] and p3[var9].order
								}
								
								return cloned
							end
							return p3
						end)
					end)
				end
			end
		end, { var1 }),
		onCaptureRemoved = reactModule.useCallback(function(p3)
			-- upvalues: var2 (ref)
			var2(function(p4)
				-- upvalues: p3 (ref)
				local cloned = table.clone(p4)
				cloned[p3] = nil
				
				return cloned
			end)
		end, {})
	}
end