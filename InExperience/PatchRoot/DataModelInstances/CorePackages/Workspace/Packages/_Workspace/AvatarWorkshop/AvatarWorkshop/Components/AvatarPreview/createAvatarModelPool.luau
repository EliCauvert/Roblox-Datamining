local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local AvatarViewportModule = require(AvatarWorkshop.Parent.AvatarViewport)
local AvatarModelBuilderModule = require(script.Parent.AvatarModelBuilder)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local AvatarPreviewUtilsModule = require(script.Parent.AvatarPreviewUtils)
local RunAndWaitForClusterCompositionModule = require(script.Parent.runAndWaitForClusterComposition)

local function _(p1)
	-- upvalues: AvatarViewportModule (copy)
	local Humanoid = AvatarViewportModule.ModelSources.finishModelSetup(p1).humanoid
	
	if Humanoid then
		Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end
end

return function(p1)
	-- upvalues: AvatarModelBuilderModule (copy), AvatarViewportModule (copy), AvatarPreviewUtilsModule (copy), RunAndWaitForClusterCompositionModule (copy)
	local P1 = p1 or AvatarModelBuilderModule
	local Models = {}
	local ApplyDefaultClothingResults = {}
	local Flag = false
	
	local function _(p2, Key)
		-- upvalues: Models (copy), P1 (copy), Flag (ref), AvatarViewportModule (upval)
		local Model = Models[Key]
		
		if Model then
			return Model, true
		end
		local Model1 = P1.createModel(p2, Key)
		
		if Flag then
			Model1:Destroy()
			
			return nil, false
		end
		local Model11 = Models[Key]
		
		if Model11 then
			Model1:Destroy()
			
			return Model11, true
		end
		local Humanoid = AvatarViewportModule.ModelSources.finishModelSetup(Model1).humanoid
		
		if Humanoid then
			Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		end
		Models[Key] = Model1
		
		return Model1, false
	end
	
	return {
		build = function(p2, Parent, Callback)
			-- upvalues: P1 (copy), Flag (ref), Models (copy), AvatarViewportModule (upval), AvatarPreviewUtilsModule (upval), ApplyDefaultClothingResults (copy), RunAndWaitForClusterCompositionModule (upval)
			local ApplyDefaultClothingResult = P1.applyDefaultClothing(p2.humanoidDescription)
			
			if Flag then
				return nil
			end
			local RigType = p2.rigType
			local Model = Models[RigType]
			local Object = nil
			local Flag1 = nil
			
			if Model then
				Object = Model
				Flag1 = true
			else
				local Model1 = P1.createModel(ApplyDefaultClothingResult, RigType)
				
				if Flag then
					Model1:Destroy()
					Object = nil
					Flag1 = false
				else
					local Model11 = Models[RigType]
					
					if Model11 then
						Model1:Destroy()
						Object = Model11
						Flag1 = true
					else
						local Humanoid = AvatarViewportModule.ModelSources.finishModelSetup(Model1).humanoid
						
						if Humanoid then
							Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
						end
						Models[RigType] = Model1
						Object = Model1
						Flag1 = false
					end
				end
			end
			if not Object then
				return nil
			end
			local List = {}
			
			for i, model in Models do
				if i ~= RigType and model.Parent ~= nil then
					model.Parent = nil
					table.insert(List, model)
				end
			end
			local IsParentMatch = Object.Parent == Parent
			local Humanoid = Object:FindFirstChildOfClass("Humanoid")
			
			local function present()
				-- upvalues: Object (copy), Parent (copy), Flag1 (copy), Humanoid (copy), P1 (upval), ApplyDefaultClothingResult (copy)
				Object.Parent = Parent
				
				if Flag1 and Humanoid then
					P1.applyDescription(Humanoid, ApplyDefaultClothingResult)
				end
			end
			
			local config = {
				humanoidDescription = ApplyDefaultClothingResult,
				rigType = RigType,
				gearId = p2.gearId
			}
			local Success, Result = pcall(function()
				-- upvalues: Humanoid (copy), AvatarPreviewUtilsModule (upval), config (copy), ApplyDefaultClothingResults (upval), RigType (copy), Callback (copy), RunAndWaitForClusterCompositionModule (upval), present (copy), Object (copy), Parent (copy), Flag1 (copy), P1 (upval), ApplyDefaultClothingResult (copy)
				if Humanoid and AvatarPreviewUtilsModule.needsClusterComposition(config, ApplyDefaultClothingResults[RigType]) then
					if Callback then
						Callback()
					end
					RunAndWaitForClusterCompositionModule(Humanoid.ClusterCompositionFinished, present, nil, function(): boolean
						-- upvalues: Object (upval)
						return Object:FindFirstChildWhichIsA("WrapLayer", true) ~= nil
					end)
					
					return
				else
					Object.Parent = Parent
					
					if Flag1 and Humanoid then
						P1.applyDescription(Humanoid, ApplyDefaultClothingResult)
					end
				end
			end)
			
			if not Success then
				if not IsParentMatch and not Flag then
					Object.Parent = nil
					
					for _, value in List do
						value.Parent = Parent
					end
				end
				error(Result, 0)
			end
			ApplyDefaultClothingResults[RigType] = ApplyDefaultClothingResult
			
			return if Flag then nil else Object
		end,
		destroy = function()
			-- upvalues: Flag (ref), Models (copy), ApplyDefaultClothingResults (copy)
			Flag = true
			
			for _, model in Models do
				model:Destroy()
			end
			table.clear(Models)
			table.clear(ApplyDefaultClothingResults)
		end
	}
end