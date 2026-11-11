local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local DashModule = require(CorePackages.Packages.Dash)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PromiseModule = require(CorePackages.Packages.Promise)
local _ = require(CorePackages.Packages.LuauPolyfill)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local SetWidgetInfoModule = require(Modules.AvatarExperience.Catalog.Actions.SetWidgetInfo)
local SetResultsListFocusedWidgetModule = require(Modules.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget)
local SetHydratedWidgetDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData)
local MySharedAvatars = WidgetConstants.ContextWidgets.MySharedAvatars

local function makeGetMySharedAvatarsApiCall(p1, UserId, NextCursor, List, p2, p3)
	-- upvalues: WebApiModule (copy), DashModule (copy), SendAXCounterV2Function (copy), ConstantsModule1 (copy), PromiseModule (copy), WidgetConstants (copy), makeGetMySharedAvatarsApiCall (copy), Logging (copy)
	return WebApiModule.GetMySharedAvatars(p1, UserId, NextCursor or ""):andThen(function(Result)
		-- upvalues: DashModule (upval), List (copy), p2 (copy), SendAXCounterV2Function (upval), ConstantsModule1 (upval), PromiseModule (upval), WidgetConstants (upval), p3 (copy), makeGetMySharedAvatarsApiCall (upval), p1 (copy), UserId (copy)
		local ResponseBody = Result.responseBody
		
		if ResponseBody and ResponseBody.data and type(ResponseBody.data) == "table" then
			local Data = ResponseBody.data
			
			if #Data < 1 then
				return PromiseModule.resolve(List, p2)
			end
			for _, entry in Data do
				table.insert(List, {
					id = entry.lookId,
					type = WidgetConstants.ContentType.Look
				})
				p2[entry.lookId] = {
					owned = true,
					assets = entry.assets,
					bundles = entry.bundles,
					id = entry.lookId,
					lookType = entry.lookType,
					moderationStatus = entry.moderationStatus,
					displayProperties = entry.displayProperties,
					type = WidgetConstants.ContentType.Look
				}
			end
			if ResponseBody.nextCursor then
				SendAXCounterV2Function(ConstantsModule1.Counter.MySharedAvatars.FetchMySharedAvatarsNewPage, { pageNum = tostring(p3) })
				
				return (makeGetMySharedAvatarsApiCall(p1, UserId, ResponseBody.nextCursor, List, p2, p3 + 1))
			else
				return PromiseModule.resolve(List, p2)
			end
		elseif #DashModule.keys(List) > 0 or #DashModule.keys(p2) > 0 then
			SendAXCounterV2Function(ConstantsModule1.Counter.MySharedAvatars.FetchMySharedAvatarsError, { StatusCode = "-206" })
			
			return PromiseModule.resolve(List, p2)
		else
			SendAXCounterV2Function(ConstantsModule1.Counter.MySharedAvatars.FetchMySharedAvatarsError, { StatusCode = "-204" })
			
			return PromiseModule.reject("No data returned from GetMySharedAvatars")
		end
	end, function(p4)
		-- upvalues: Logging (upval), SendAXCounterV2Function (upval), ConstantsModule1 (upval), DashModule (upval), List (copy), p2 (copy), PromiseModule (upval)
		Logging.warn("WebApi failure in FetchMySharedAvatars: " .. tostring(p4))
		
		if p4 then
			SendAXCounterV2Function(ConstantsModule1.Counter.MySharedAvatars.FetchMySharedAvatarsError, { StatusCode = tostring(p4.StatusCode or -1) })
		end
		if #DashModule.keys(List) > 0 or #DashModule.keys(p2) > 0 then
			SendAXCounterV2Function(ConstantsModule1.Counter.MySharedAvatars.FetchMySharedAvatarsError, { StatusCode = "-207" })
			
			return PromiseModule.resolve(List, p2)
		else
			return PromiseModule.reject(p4)
		end
	end)
end

return function(p4)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), ConstantsModule (copy), UtilsModule (copy), SendAXCounterV2Function (copy), ConstantsModule1 (copy), PromiseModule (copy), MySharedAvatars (copy), SetResultsListFocusedWidgetModule (copy), makeGetMySharedAvatarsApiCall (copy), WidgetConstants (copy), SetWidgetInfoModule (copy), SetHydratedWidgetDataModule (copy), MutedErrorModule (copy)
	ArgCheckModule.isType(p4, "function", "FetchMySharedAvatars thunk expects networkImpl to be a function")
	
	return PerformFetch.Single(ConstantsModule.GetMySharedAvatarsKey, function(p5)
		-- upvalues: UtilsModule (upval), SendAXCounterV2Function (upval), ConstantsModule1 (upval), PromiseModule (upval), MySharedAvatars (upval), SetResultsListFocusedWidgetModule (upval), makeGetMySharedAvatarsApiCall (upval), p4 (copy), WidgetConstants (upval), SetWidgetInfoModule (upval), SetHydratedWidgetDataModule (upval), MutedErrorModule (upval)
		local UserId = UtilsModule.getUserId((p5:getState()))
		
		if UserId then
			p5:dispatch(SetResultsListFocusedWidgetModule(MySharedAvatars.RequestId, MySharedAvatars.WidgetId, {
				title = MySharedAvatars.Title,
				tooltip = MySharedAvatars.Tooltip
			}))
			
			return makeGetMySharedAvatarsApiCall(p4, UserId, nil, {}, {}, 1):andThen(function(Result, p6)
				-- upvalues: MySharedAvatars (upval), WidgetConstants (upval), p5 (copy), SetWidgetInfoModule (upval), SetHydratedWidgetDataModule (upval)
				p5:dispatch(SetWidgetInfoModule({
					[MySharedAvatars.Context] = {
						content = Result,
						template = {
							title = MySharedAvatars.Title,
							type = WidgetConstants.Templates.ItemGroup
						},
						id = MySharedAvatars.WidgetId,
						requestId = MySharedAvatars.RequestId,
						type = WidgetConstants.Types.MySharedAvatarsWidget
					}
				}, MySharedAvatars.RequestId, nil, MySharedAvatars.Context))
				p5:dispatch(SetHydratedWidgetDataModule({ [WidgetConstants.ContentType.Look] = p6 }))
			end):catch(function(Err)
				-- upvalues: MutedErrorModule (upval), UserId (copy), SendAXCounterV2Function (upval), ConstantsModule1 (upval)
				MutedErrorModule(string.format("[AvatarExperience] Failed to fetch MySharedAvatars for user %s with error: %s", tostring(UserId), (tostring(Err))))
				SendAXCounterV2Function(ConstantsModule1.Counter.MySharedAvatars.FetchMySharedAvatarsError, { StatusCode = "-500" })
			end)
		else
			SendAXCounterV2Function(ConstantsModule1.Counter.MySharedAvatars.FetchMySharedAvatarsError, { StatusCode = "-403" })
			
			return PromiseModule.reject("No userId found")
		end
	end)
end