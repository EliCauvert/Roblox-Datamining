local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(script.Parent.AssetLibraryTypes)
local filterAssetTilesModule = require(script.Parent.filterAssetTiles)
local collectWorkspaceModels = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels).collectWorkspaceModels

return function(p1)
	-- upvalues: reactModule (ref), collectWorkspaceModels (ref), filterAssetTilesModule (ref)
	local var1, var2 = reactModule.useState(0)
	local var3, var4 = reactModule.useState({
		assets = {},
		status = if p1.isAvailable == false then "Ready" else "Loading",
		onRetry = function() end
	})
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(function(p2)
			return p2 + 1
		end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), collectWorkspaceModels (copy), var4 (ref), var5 (ref), filterAssetTilesModule (copy)
		if p1.isAvailable == false then
			return function() end
		end
		local dependencies = p1.dependencies
		local var6 = if dependencies ~= nil then workspace else dependencies.workspace
		local var7 = nil
		local var8 = false
		
		local function rewalk()
			-- upvalues: var8 (write), collectWorkspaceModels (copy), dependencies (ref), var4 (copy), var5 (copy), p1 (copy), filterAssetTilesModule (copy)
			if var8 then return end
			local ok, status = pcall(collectWorkspaceModels, dependencies)
			
			if not ok then
				var4({ status = "Failed", assets = {}, onRetry = var5 })
				
				return
			end
			local t = {}
			
			for i, v in status do
				table.insert(t, {
					assetId = nil,
					assetType = "Model",
					tileKey = `workspace-model-{v.id}`,
					displayName = v.name,
					model = v.model,
					onActivated = if p1.onOpenModel == nil then nil else function()
						-- upvalues: p1 (copy), v (ref)
						p1.onOpenModel(v)
					end
				})
			end
			var4({
				status = "Ready",
				assets = filterAssetTilesModule(t, p1.query),
				onRetry = var5
			})
		end
		
		local function scheduleRewalk()
			-- upvalues: var7 (write), rewalk (ref)
			if var7 ~= nil then
				task.cancel(var7)
			end
			var7 = task.delay(0.25, function()
				-- upvalues: var7 (copy), rewalk (copy)
				var7 = nil
				rewalk()
			end)
		end
		
		rewalk()
		local list = {
			var6.ChildAdded:Connect(scheduleRewalk),
			var6.ChildRemoved:Connect(scheduleRewalk),
			var6.DescendantAdded:Connect(scheduleRewalk),
			var6.DescendantRemoving:Connect(scheduleRewalk)
		}
		
		return function()
			-- upvalues: var8 (write), var7 (write), list (ref)
			var8 = true
			
			if var7 ~= nil then
				task.cancel(var7)
			end
			for i, v in list do
				v:Disconnect()
			end
		end
	end, {
		p1.dependencies or false, p1.isAvailable == false, p1.onOpenModel or false,
		p1.query or "", var1, var5
	})
	
	return var3
end