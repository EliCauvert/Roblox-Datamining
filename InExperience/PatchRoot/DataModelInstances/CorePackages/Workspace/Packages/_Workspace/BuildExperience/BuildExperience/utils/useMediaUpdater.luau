local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local GetAssetUserAuthStoreFunction = require(Parent.DataHydration.AssetUserAuth).getAssetUserAuthStore
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local FormatErrorModule = require(script.Parent.formatError)

return function(p1)
	-- upvalues: ReactModule (copy), PromiseModule (copy), Debug (copy), GetAssetUserAuthStoreFunction (copy), FormatErrorModule (copy)
	local UseRefResult = ReactModule.useRef(PromiseModule.resolve())
	local OnSuccess = p1 and p1.onSuccess
	local OnError = p1 and p1.onError
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: Debug (upval), UseRefResult (copy), GetAssetUserAuthStoreFunction (upval), PromiseModule (upval), OnSuccess (copy), FormatErrorModule (upval), OnError (copy)
		Debug.log("info", `media_updater {p3} enqueued`)
		local Promise = UseRefResult.current:catch(function()
			return nil
		end):andThen(p2):andThen(function(Result)
			-- upvalues: GetAssetUserAuthStoreFunction (upval)
			return GetAssetUserAuthStoreFunction().pollUntilDone(Result)
		end):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return if typeof(Result) == "table" and Result.status == "timed_out" then PromiseModule.reject("Operation did not complete in time") elseif Result.status == "done" then Result.operation else Result
		end)
		UseRefResult.current = Promise:catch(function()
			return nil
		end)
		
		return Promise:andThen(function(Result)
			-- upvalues: Debug (upval), p3 (copy), OnSuccess (upval)
			Debug.log("info", `media_updater {p3} succeeded`)
			
			if OnSuccess then
				OnSuccess()
			end
			return Result
		end):catch(function(Err)
			-- upvalues: FormatErrorModule (upval), Debug (upval), p3 (copy), OnError (upval), PromiseModule (upval)
			local FormatErrorModuleResult = FormatErrorModule(Err)
			Debug.log("warn", `media_updater {p3} failed`, { error = FormatErrorModuleResult })
			
			if OnError then
				OnError(FormatErrorModuleResult)
			end
			return PromiseModule.reject(Err)
		end)
	end, { OnSuccess, OnError })
	
	return {
		setIcon = ReactModule.useCallback(function(p2, p3)
			-- upvalues: UseResult (copy), PromiseModule (upval), GetAssetUserAuthStoreFunction (upval)
			return UseResult(function()
				-- upvalues: PromiseModule (upval), p3 (copy), GetAssetUserAuthStoreFunction (upval), p2 (copy)
				return PromiseModule.resolve(p3):andThen(function(Result)
					-- upvalues: GetAssetUserAuthStoreFunction (upval), p2 (upval)
					return GetAssetUserAuthStoreFunction().updateIcon(p2, Result)
				end)
			end, "setIcon")
		end, { UseResult }),
		addPreview = ReactModule.useCallback(function(p2, p3)
			-- upvalues: UseResult (copy), GetAssetUserAuthStoreFunction (upval), PromiseModule (upval)
			return UseResult(function()
				-- upvalues: GetAssetUserAuthStoreFunction (upval), PromiseModule (upval), p3 (copy), p2 (copy)
				local AssetUserAuthStore = GetAssetUserAuthStoreFunction()
				
				return PromiseModule.resolve(p3):andThen(function(Result)
					-- upvalues: AssetUserAuthStore (copy), p2 (upval)
					return AssetUserAuthStore.getPreviews(p2):andThen(function(Tbl)
						-- upvalues: Result (copy), AssetUserAuthStore (upval), p2 (upval)
						local Copy = table.clone(Tbl)
						table.insert(Copy, { asset = `assets/{Result}` })
						
						return AssetUserAuthStore.updatePreviews(p2, Copy)
					end)
				end)
			end, "addPreview")
		end, { UseResult }),
		replacePreview = ReactModule.useCallback(function(p2, p3, Asset)
			-- upvalues: UseResult (copy), GetAssetUserAuthStoreFunction (upval), PromiseModule (upval)
			return UseResult(function()
				-- upvalues: GetAssetUserAuthStoreFunction (upval), PromiseModule (upval), p3 (copy), p2 (copy), Asset (copy)
				local AssetUserAuthStore = GetAssetUserAuthStoreFunction()
				
				return PromiseModule.resolve(p3):andThen(function(Result)
					-- upvalues: AssetUserAuthStore (copy), p2 (upval), Asset (upval), PromiseModule (upval)
					return AssetUserAuthStore.getPreviews(p2):andThen(function(Tbl)
						-- upvalues: Asset (upval), PromiseModule (upval), Result (copy), AssetUserAuthStore (upval), p2 (upval)
						local v1 = nil
						
						for i, value in Tbl do
							if value.asset == Asset then
								v1 = i
								break
							end
						end
						if v1 == nil then
							return PromiseModule.reject(`Preview "{Asset}" not found`)
						else
							local Copy = table.clone(Tbl)
							local Copy1 = table.clone(Tbl[v1])
							Copy1.asset = `assets/{Result}`
							Copy[v1] = Copy1
							
							return AssetUserAuthStore.updatePreviews(p2, Copy)
						end
					end)
				end)
			end, "replacePreview")
		end, { UseResult }),
		removePreview = ReactModule.useCallback(function(p4, Asset)
			-- upvalues: UseResult (copy), GetAssetUserAuthStoreFunction (upval), PromiseModule (upval)
			return UseResult(function()
				-- upvalues: GetAssetUserAuthStoreFunction (upval), p4 (copy), Asset (copy), PromiseModule (upval)
				local AssetUserAuthStore = GetAssetUserAuthStoreFunction()
				
				return AssetUserAuthStore.getPreviews(p4):andThen(function(Tbl)
					-- upvalues: Asset (upval), PromiseModule (upval), AssetUserAuthStore (copy), p4 (upval)
					local Index = nil
					
					for i, value in Tbl do
						if value.asset == Asset then
							Index = i
							break
						end
					end
					if Index == nil then
						return PromiseModule.reject(`Preview "{Asset}" not found`)
					else
						local Copy = table.clone(Tbl)
						table.remove(Copy, Index)
						
						return AssetUserAuthStore.updatePreviews(p4, Copy)
					end
				end)
			end, "removePreview")
		end, { UseResult })
	}
end