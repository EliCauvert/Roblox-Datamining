local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local getAssetUserAuthStore = require(parent.DataHydration.AssetUserAuth).getAssetUserAuthStore
local debug = require(parent.DataHydration.CreatorAgentChat).debug
local formatErrorModule = require(script.Parent.formatError)

return function(p1)
	-- upvalues: reactModule (ref), promiseModule (ref), debug (ref), getAssetUserAuthStore (ref), formatErrorModule (ref)
	local var1 = reactModule.useRef(promiseModule.resolve())
	local onSuccess = p1 and p1.onSuccess
	local onError = p1 and p1.onError
	local var2 = reactModule.useCallback(function(p2, p3)
		-- upvalues: debug (copy), var1 (ref), getAssetUserAuthStore (copy), promiseModule (copy), onSuccess (ref), formatErrorModule (copy), onError (ref)
		debug.log("info", `media_updater {p3} enqueued`)
		local var3 = var1.current:catch(function()
			return nil
		end):andThen(p2):andThen(function(p4)
			-- upvalues: getAssetUserAuthStore (copy)
			return getAssetUserAuthStore().pollUntilDone(p4)
		end):andThen(function(p4)
			-- upvalues: promiseModule (copy)
			return if typeof(p4) == "table" and p4.status == "timed_out" then promiseModule.reject("Operation did not complete in time") elseif p4.status == "done" then p4.operation else p4
		end)
		var1.current = var3:catch(function()
			return nil
		end)
		
		return var3:andThen(function(p4)
			-- upvalues: debug (copy), p3 (ref), onSuccess (copy)
			debug.log("info", `media_updater {p3} succeeded`)
			
			if onSuccess then
				onSuccess()
			end
			return p4
		end):catch(function(p4)
			-- upvalues: formatErrorModule (copy), debug (copy), p3 (ref), onError (copy), promiseModule (copy)
			local var4 = formatErrorModule(p4)
			debug.log("warn", `media_updater {p3} failed`, { error = var4 })
			
			if onError then
				onError(var4)
			end
			return promiseModule.reject(p4)
		end)
	end, { onSuccess, onError })
	
	return {
		setIcon = reactModule.useCallback(function(p2, p3)
			-- upvalues: var2 (ref), promiseModule (copy), getAssetUserAuthStore (copy)
			return var2(function()
				-- upvalues: promiseModule (copy), p3 (ref), getAssetUserAuthStore (copy), p2 (ref)
				return promiseModule.resolve(p3):andThen(function(p4)
					-- upvalues: getAssetUserAuthStore (copy), p2 (copy)
					return getAssetUserAuthStore().updateIcon(p2, p4)
				end)
			end, "setIcon")
		end, { var2 }),
		addPreview = reactModule.useCallback(function(p2, p3)
			-- upvalues: var2 (ref), getAssetUserAuthStore (copy), promiseModule (copy)
			return var2(function()
				-- upvalues: getAssetUserAuthStore (copy), promiseModule (copy), p3 (ref), p2 (ref)
				local var3 = getAssetUserAuthStore()
				
				return promiseModule.resolve(p3):andThen(function(p4)
					-- upvalues: var3 (ref), p2 (copy)
					return var3.getPreviews(p2):andThen(function(p5)
						-- upvalues: p4 (ref), var3 (copy), p2 (copy)
						local cloned = table.clone(p5)
						table.insert(cloned, { asset = `assets/{p4}` })
						
						return var3.updatePreviews(p2, cloned)
					end)
				end)
			end, "addPreview")
		end, { var2 }),
		replacePreview = reactModule.useCallback(function(p2, p3, p4)
			-- upvalues: var2 (ref), getAssetUserAuthStore (copy), promiseModule (copy)
			return var2(function()
				-- upvalues: getAssetUserAuthStore (copy), promiseModule (copy), p3 (ref), p2 (ref), p4 (ref)
				local var3 = getAssetUserAuthStore()
				
				return promiseModule.resolve(p3):andThen(function(p5)
					-- upvalues: var3 (ref), p2 (copy), p4 (copy), promiseModule (copy)
					return var3.getPreviews(p2):andThen(function(p6)
						-- upvalues: p4 (copy), promiseModule (copy), p5 (ref), var3 (copy), p2 (copy)
						local var4 = nil
						
						for i, v in p6 do
							if v.asset == p4 then
								var4 = i
								break
							end
						end
						if var4 == nil then
							return promiseModule.reject(`Preview "{p16}" not found`)
						end
						local cloned = table.clone(p6)
						local cloned_1 = table.clone(p6[var4])
						cloned_1.asset = `assets/{p5}`
						cloned[var4] = cloned_1
						
						return var3.updatePreviews(p2, cloned)
					end)
				end)
			end, "replacePreview")
		end, { var2 }),
		removePreview = reactModule.useCallback(function(p5, p6)
			-- upvalues: var2 (ref), getAssetUserAuthStore (copy), promiseModule (copy)
			return var2(function()
				-- upvalues: getAssetUserAuthStore (copy), p5 (ref), p6 (ref), promiseModule (copy)
				local var3 = getAssetUserAuthStore()
				
				return var3.getPreviews(p5):andThen(function(p7)
					-- upvalues: p6 (copy), promiseModule (copy), var3 (ref), p5 (copy)
					local var4 = nil
					
					for i, v in p7 do
						if v.asset == p6 then
							var4 = i
							break
						end
					end
					if var4 == nil then
						return promiseModule.reject(`Preview "{p20}" not found`)
					end
					local cloned = table.clone(p7)
					table.remove(cloned, var4)
					
					return var3.updatePreviews(p5, cloned)
				end)
			end, "removePreview")
		end, { var2 })
	}
end