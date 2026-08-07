local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local getAssetUserAuthStore = require(parent.DataHydration.AssetUserAuth).getAssetUserAuthStore
local debug = require(parent.DataHydration.CreatorAgentChat).debug

local function _(p0) --[[ line: 32 | named "formatError" ]]
	return if typeof(p0) == "string" then p0 elseif typeof(p0) == "table" and p0.errorMessage then `HTTP {tostring(p0.responseCode)}: {p0.errorMessage}` else tostring(p0)
end

return function(p1) --[[ line: 41 | named "useMediaUpdater" ]]
	-- upvalues: reactModule (ref), promiseModule (ref), debug (ref), getAssetUserAuthStore (ref)
	local var2 = reactModule.useRef(promiseModule.resolve())
	local onSuccess = p1 and p1.onSuccess
	local onError = p1 and p1.onError
	local var5 = reactModule.useCallback(function(p2, p3) --[[ line: 46 ]]
		-- upvalues: debug (copy), var2 (ref), getAssetUserAuthStore (copy), promiseModule (copy), onSuccess (ref), onError (ref)
		debug.log("info", `media_updater {p3} enqueued`)
		local var6 = var2.current:catch(function() --[[ line: 49 ]]
			return nil
		end):andThen(p2):andThen(function(p5) --[[ line: 53 ]]
			-- upvalues: getAssetUserAuthStore (copy)
			return getAssetUserAuthStore().pollUntilDone(p5)
		end):andThen(function(p4) --[[ line: 56 ]]
			-- upvalues: promiseModule (copy)
			return if typeof(p4) == "table" and p4.status == "timed_out" then promiseModule.reject("Operation did not complete in time") elseif p4.status == "done" then p4.operation else p4
		end)
		var2.current = var6:catch(function() --[[ line: 63 ]]
			return nil
		end)
		
		return var6:andThen(function(p7) --[[ line: 68 ]]
			-- upvalues: debug (copy), p3 (ref), onSuccess (copy)
			debug.log("info", `media_updater {p3} succeeded`)
			
			if onSuccess then
				onSuccess()
			end
			return p7
		end):catch(function(p6) --[[ line: 75 ]]
			-- upvalues: debug (copy), p3 (ref), onError (copy), promiseModule (copy)
			local var7 = if typeof(p6) == "string" then p6 elseif typeof(p6) == "table" and p6.errorMessage then `HTTP {tostring(p6.responseCode)}: {p6.errorMessage}` else tostring(p6)
			debug.log("warn", `media_updater {p3} failed`, { error = var7 })
			
			if onError then
				onError(var7)
			end
			return promiseModule.reject(p6)
		end)
	end, { onSuccess, onError })
	
	return {
		setIcon = reactModule.useCallback(function(p8, p9) --[[ line: 85 ]]
			-- upvalues: var5 (ref), promiseModule (copy), getAssetUserAuthStore (copy)
			return var5(function() --[[ line: 86 ]]
				-- upvalues: promiseModule (copy), p9 (ref), getAssetUserAuthStore (copy), p8 (ref)
				return promiseModule.resolve(p9):andThen(function(p10) --[[ line: 87 ]]
					-- upvalues: getAssetUserAuthStore (copy), p8 (copy)
					return getAssetUserAuthStore().updateIcon(p8, p10)
				end)
			end, "setIcon")
		end, { var5 }),
		addPreview = reactModule.useCallback(function(p11, p12) --[[ line: 94 ]]
			-- upvalues: var5 (ref), getAssetUserAuthStore (copy), promiseModule (copy)
			return var5(function() --[[ line: 95 ]]
				-- upvalues: getAssetUserAuthStore (copy), promiseModule (copy), p12 (ref), p11 (ref)
				local var8 = getAssetUserAuthStore()
				
				return promiseModule.resolve(p12):andThen(function(p13) --[[ line: 97 ]]
					-- upvalues: var8 (ref), p11 (copy)
					return var8.getPreviews(p11):andThen(function(p14) --[[ line: 98 ]]
						-- upvalues: p13 (ref), var8 (copy), p11 (copy)
						local cloned = table.clone(p14)
						table.insert(cloned, { asset = `assets/{p13}` })
						
						return var8.updatePreviews(p11, cloned)
					end)
				end)
			end, "addPreview")
		end, { var5 }),
		replacePreview = reactModule.useCallback(function(p15, p16, p17) --[[ line: 110 ]]
			-- upvalues: var5 (ref), getAssetUserAuthStore (copy), promiseModule (copy)
			return var5(function() --[[ line: 111 ]]
				-- upvalues: getAssetUserAuthStore (copy), promiseModule (copy), p16 (ref), p15 (ref), p17 (ref)
				local var10 = getAssetUserAuthStore()
				
				return promiseModule.resolve(p16):andThen(function(p18) --[[ line: 113 ]]
					-- upvalues: var10 (ref), p15 (copy), p17 (copy), promiseModule (copy)
					return var10.getPreviews(p15):andThen(function(p19) --[[ line: 114 ]]
						-- upvalues: p17 (copy), promiseModule (copy), p18 (ref), var10 (copy), p15 (copy)
						local var11 = nil
						
						for i, v in p19 do
							if v.asset == p17 then
								var11 = i
								break
							end
						end
						if var11 == nil then
							return promiseModule.reject(`Preview "{p17}" not found`)
						end
						local cloned = table.clone(p19)
						local cloned_1 = table.clone(p19[var11])
						cloned_1.asset = `assets/{p18}`
						cloned[var11] = cloned_1
						
						return var10.updatePreviews(p15, cloned)
					end)
				end)
			end, "replacePreview")
		end, { var5 }),
		removePreview = reactModule.useCallback(function(p20, p21) --[[ line: 137 ]]
			-- upvalues: var5 (ref), getAssetUserAuthStore (copy), promiseModule (copy)
			return var5(function() --[[ line: 138 ]]
				-- upvalues: getAssetUserAuthStore (copy), p20 (ref), p21 (ref), promiseModule (copy)
				local var14 = getAssetUserAuthStore()
				
				return var14.getPreviews(p20):andThen(function(p22) --[[ line: 140 ]]
					-- upvalues: p21 (copy), promiseModule (copy), var14 (ref), p20 (copy)
					local var15 = nil
					
					for i, v in p22 do
						if v.asset == p21 then
							var15 = i
							break
						end
					end
					if var15 == nil then
						return promiseModule.reject(`Preview "{p21}" not found`)
					end
					local cloned = table.clone(p22)
					table.remove(cloned, var15)
					
					return var14.updatePreviews(p20, cloned)
				end)
			end, "removePreview")
		end, { var5 })
	}
end