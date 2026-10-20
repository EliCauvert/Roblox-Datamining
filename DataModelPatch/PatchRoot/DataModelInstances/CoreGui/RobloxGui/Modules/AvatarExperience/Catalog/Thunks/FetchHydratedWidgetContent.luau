local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local CryoModule = require(CorePackages.Packages.Cryo)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetHydratedWidgetDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData)
local GetFFlagAXAnimatedLooksThumbnailsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXAnimatedLooksThumbnails)

return function(p1, p2, Text)
	-- upvalues: PerformFetch (copy), WebApiModule (copy), GetFFlagAXAnimatedLooksThumbnailsModule (copy), CryoModule (copy), SetHydratedWidgetDataModule (copy), Logging (copy), PromiseModule (copy)
	return PerformFetch.Single("hydrateWidgetKey." .. Text, function(p3)
		-- upvalues: WebApiModule (upval), p1 (copy), p2 (copy), GetFFlagAXAnimatedLooksThumbnailsModule (upval), CryoModule (upval), SetHydratedWidgetDataModule (upval), Logging (upval), PromiseModule (upval)
		return WebApiModule.HydrateWidgetContent(p1, p2):andThen(function(Result)
			-- upvalues: p2 (upval), GetFFlagAXAnimatedLooksThumbnailsModule (upval), CryoModule (upval), p3 (copy), SetHydratedWidgetDataModule (upval)
			local ResponseBody = if Result then Result.responseBody else nil
			local HydratedContent = if ResponseBody then ResponseBody.hydratedContent else nil
			
			if HydratedContent == nil then return end
			assert(HydratedContent, "")
			local t = {}
			
			for _, value in HydratedContent do
				local Type = value.type
				local Text = tostring(value.id)
				
				if not t[Type] then
					t[Type] = {}
				end
				t[Type][Text] = value
			end
			for _, value1 in p2 do
				local Type = value1.type
				local Text = tostring(value1.id)
				
				if not t[Type] then
					t[Type] = {}
				end
				if not t[Type][Text] then
					t[Type][Text] = { failedToHydrate = true, id = value1.id, type = Type }
				elseif GetFFlagAXAnimatedLooksThumbnailsModule() then
					t[Type][Text] = CryoModule.Dictionary.join(value1, t[Type][Text])
				end
			end
			p3:dispatch(SetHydratedWidgetDataModule(t))
		end, function(p4)
			-- upvalues: Logging (upval), PromiseModule (upval)
			Logging.warn("WebApi failure in FetchHydratedWidgetContent: " .. tostring(p4))
			
			return PromiseModule.reject(p4)
		end)
	end)
end