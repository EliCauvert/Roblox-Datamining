local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local getAssetUserAuthStore = require(parent.DataHydration.AssetUserAuth).getAssetUserAuthStore
local debug = require(parent.DataHydration.CreatorAgentChat).debug
local formatErrorModule = require(script.Parent.formatError)

return function(p0) --[[ line: 34 | named "useMediaUpdater" ]]
	-- upvalues: reactModule (ref), promiseModule (ref), debug (ref), getAssetUserAuthStore (ref), formatErrorModule (ref)
	local var3 = reactModule.useRef(promiseModule.resolve())
	local onSuccess = p0 and p0.onSuccess
	local onError = p0 and p0.onError
	local var6 = reactModule.useCallback(function(p1, p2) --[[ line: 39 ]]
		-- upvalues: debug (copy), var3 (ref), getAssetUserAuthStore (copy), promiseModule (copy), onSuccess (ref), formatErrorModule (copy), onError (ref)
		debug.log("info", `media_updater {p2} enqueued`)
		local var7 = var3.current:catch(function() --[[ line: 42 ]]
			return nil
		end):andThen(p1):andThen(function(p4) --[[ line: 46 ]]
			-- upvalues: getAssetUserAuthStore (copy)
			return getAssetUserAuthStore().pollUntilDone(p4)
		end):andThen(function(p3) --[[ line: 49 ]]
			-- upvalues: promiseModule (copy)
			return if typeof(p3) == "table" and p3.status == "timed_out" then promiseModule.reject("Operation did not complete in time") elseif p3.status == "done" then p3.operation else p3
		end)
		var3.current = var7:catch(function() --[[ line: 56 ]]
			return nil
		end)
		
		return var7:andThen(function(p6) --[[ line: 61 ]]
			-- upvalues: debug (copy), p2 (ref), onSuccess (copy)
			debug.log("info", `media_updater {p2} succeeded`)
			
			if onSuccess then
				onSuccess()
			end
			return p6
		end):catch(function(p5) --[[ line: 68 ]]
			-- upvalues: formatErrorModule (copy), debug (copy), p2 (ref), onError (copy), promiseModule (copy)
			local var8 = formatErrorModule(p5)
			debug.log("warn", `media_updater {p2} failed`, { error = var8 })
			
			if onError then
				onError(var8)
			end
			return promiseModule.reject(p5)
		end)
	end, { onSuccess, onError })
	
	return {
		setIcon = reactModule.useCallback(function(p7, p8) --[[ line: 78 ]]
			-- upvalues: var6 (ref), promiseModule (copy), getAssetUserAuthStore (copy)
			return var6(function() --[[ line: 79 ]]
				-- upvalues: promiseModule (copy), p8 (ref), getAssetUserAuthStore (copy), p7 (ref)
				return promiseModule.resolve(p8):andThen(function(p9) --[[ line: 80 ]]
					-- upvalues: getAssetUserAuthStore (copy), p7 (copy)
					return getAssetUserAuthStore().updateIcon(p7, p9)
				end)
			end, "setIcon")
		end, { var6 }),
		addPreview = reactModule.useCallback(function(p10, p11) --[[ line: 87 ]]
			-- upvalues: var6 (ref), getAssetUserAuthStore (copy), promiseModule (copy)
			return var6(function() --[[ line: 88 ]]
				-- upvalues: getAssetUserAuthStore (copy), promiseModule (copy), p11 (ref), p10 (ref)
				local var9 = getAssetUserAuthStore()
				
				return promiseModule.resolve(p11):andThen(function(p12) --[[ line: 90 ]]
					-- upvalues: var9 (ref), p10 (copy)
					return var9.getPreviews(p10):andThen(function(p13) --[[ line: 91 ]]
						-- upvalues: p12 (ref), var9 (copy), p10 (copy)
						local cloned = table.clone(p13)
						table.insert(cloned, { asset = `assets/{p12}` })
						
						return var9.updatePreviews(p10, cloned)
					end)
				end)
			end, "addPreview")
		end, { var6 }),
		replacePreview = reactModule.useCallback(function(p14, p15, p16) --[[ line: 103 ]]
			-- upvalues: var6 (ref), getAssetUserAuthStore (copy), promiseModule (copy)
			return var6(function() --[[ line: 104 ]]
				-- upvalues: getAssetUserAuthStore (copy), promiseModule (copy), p15 (ref), p14 (ref), p16 (ref)
				local var11 = getAssetUserAuthStore()
				
				return promiseModule.resolve(p15):andThen(function(p17) --[[ line: 106 ]]
					-- upvalues: var11 (ref), p14 (copy), p16 (copy), promiseModule (copy)
					return var11.getPreviews(p14):andThen(function(p18) --[[ line: 107 ]]
						-- upvalues: p16 (copy), promiseModule (copy), p17 (ref), var11 (copy), p14 (copy)
						local var12 = nil
						
						for i, v in p18 do
							if v.asset == p16 then
								var12 = i
								break
							end
						end
						if var12 == nil then
							return promiseModule.reject(`Preview "{p16}" not found`)
						end
						local cloned = table.clone(p18)
						local cloned_1 = table.clone(p18[var12])
						cloned_1.asset = `assets/{p17}`
						cloned[var12] = cloned_1
						
						return var11.updatePreviews(p14, cloned)
					end)
				end)
			end, "replacePreview")
		end, { var6 }),
		removePreview = reactModule.useCallback(function(p19, p20) --[[ line: 130 ]]
			-- upvalues: var6 (ref), getAssetUserAuthStore (copy), promiseModule (copy)
			return var6(function() --[[ line: 131 ]]
				-- upvalues: getAssetUserAuthStore (copy), p19 (ref), p20 (ref), promiseModule (copy)
				local var15 = getAssetUserAuthStore()
				
				return var15.getPreviews(p19):andThen(function(p21) --[[ line: 133 ]]
					-- upvalues: p20 (copy), promiseModule (copy), var15 (ref), p19 (copy)
					local var16 = nil
					
					for i, v in p21 do
						if v.asset == p20 then
							var16 = i
							break
						end
					end
					if var16 == nil then
						return promiseModule.reject(`Preview "{p20}" not found`)
					end
					local cloned = table.clone(p21)
					table.remove(cloned, var16)
					
					return var15.updatePreviews(p19, cloned)
				end)
			end, "removePreview")
		end, { var6 })
	}
end