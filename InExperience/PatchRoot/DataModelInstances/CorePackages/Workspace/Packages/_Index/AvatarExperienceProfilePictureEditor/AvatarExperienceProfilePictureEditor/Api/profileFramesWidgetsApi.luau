local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local HttpModule = require(Parent.Http)
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local EnumsModule = require(AvatarExperienceProfilePictureEditor.Common.Enums)
local GetWidgetListInfoFunction = require(Parent.AvatarExperienceCatalog).Api.getWidgetListInfo

local function extractWidgetContent(WidgetListInfo) --[[ Line: 35 ]]
	local List = {}
	
	if WidgetListInfo == nil then
		return List
	end
	local Widgets = WidgetListInfo.widgets
	
	if Widgets == nil then
		return List
	end
	for _, widget in pairs(Widgets) do
		local Content = widget.content
		
		if Content ~= nil then
			for _, value in Content do
				table.insert(List, { type = value.type, id = value.id })
			end
		end
	end
	return List
end

local function hydrateWidgetContent(Callback, Content) --[[ Line: 63 ]]
	-- upvalues: HttpService (copy), HttpModule (copy), EnumsModule (copy)
	return if #Content == 0 then nil else Callback(`{HttpModule.Url.APIS_URL}marketplace-widgets/v1/widgets/hydrate`, EnumsModule.RequestMethods.POST, { postBody = HttpService:JSONEncode({ Content = Content }) }):andThen(function(Result) --[[ Line: 73 ]]
		return Result.responseBody
	end)
end

local function processWidgetsResponseAndHydrate(p1, WidgetListInfo) --[[ Line: 79 ]]
	-- upvalues: extractWidgetContent (copy), PromiseModule (copy), hydrateWidgetContent (copy)
	local ExtractWidgetContentResult = extractWidgetContent(WidgetListInfo)
	
	return if #ExtractWidgetContentResult == 0 then PromiseModule.resolve({
		hydrateResponseBody = nil,
		widgetListInfo = WidgetListInfo,
		widgetContent = ExtractWidgetContentResult
	}) else hydrateWidgetContent(p1, ExtractWidgetContentResult):andThen(function(Result) --[[ Line: 90 ]]
		-- upvalues: WidgetListInfo (copy), ExtractWidgetContentResult (copy)
		return {
			widgetListInfo = WidgetListInfo,
			hydrateResponseBody = Result,
			widgetContent = ExtractWidgetContentResult
		}
	end)
end

local function _(p1) --[[ Line: 99 | Named "toGetWidgetListInfoRequestImpl" ]]
	return function(p2, p3) --[[ Line: 100 ]]
		-- upvalues: p1 (copy)
		return p1(p2, p3)
	end
end

return {
	PROFILE_FRAMES_WIDGET_CONTEXT = "catalog-tab:profile-frames",
	buildHydrateUrl = function(): string --[[ Line: 31 ]]
		-- upvalues: HttpModule (copy)
		return `{HttpModule.Url.APIS_URL}marketplace-widgets/v1/widgets/hydrate`
	end,
	extractWidgetContent = extractWidgetContent,
	fetchProfileFramesWidgets = function(Callback, p1) --[[ Line: 105 ]]
		-- upvalues: HttpService (copy), GetWidgetListInfoFunction (copy), processWidgetsResponseAndHydrate (copy)
		return GetWidgetListInfoFunction(function(p2, p3) --[[ Line: 100 ]]
			-- upvalues: Callback (copy)
			return Callback(p2, p3)
		end, if p1 and p1.requestId then p1.requestId else HttpService:GenerateGUID(false), "catalog-tab:profile-frames", nil):andThen(function(Result) --[[ Line: 114 ]]
			-- upvalues: processWidgetsResponseAndHydrate (upval), Callback (copy)
			return processWidgetsResponseAndHydrate(Callback, Result)
		end)
	end
}