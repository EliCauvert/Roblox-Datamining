local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local httpModule = require(parent.Http)
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)
local getWidgetListInfo = require(parent.AvatarExperienceCatalog).Api.getWidgetListInfo

local function buildHydrateUrl() --[[ line: 31 ]]
	-- upvalues: httpModule (ref)
	return `{httpModule.Url.APIS_URL}marketplace-widgets/v1/widgets/hydrate`
end

local function extractWidgetContent(p0) --[[ line: 35 ]]
	local t = {}
	
	if p0 == nil then
		return t
	end
	local widgets = p0.widgets
	
	if widgets == nil then
		return t
	end
	for i, v in pairs(widgets) do
		local content = v.content
		
		if content ~= nil then
			for i_1, v_1 in content do
				table.insert(t, { type = v_1.type, id = v_1.id })
			end
		end
	end
	return t
end

local function hydrateWidgetContent(p1, p2) --[[ line: 63 ]]
	-- upvalues: httpService (ref), httpModule (ref), enumsModule (ref)
	return if #p2 == 0 then nil else p1(`{httpModule.Url.APIS_URL}marketplace-widgets/v1/widgets/hydrate`, enumsModule.RequestMethods.POST, { postBody = httpService:JSONEncode({ Content = p2 }) }):andThen(function(p3) --[[ line: 73 ]]
		return p3.responseBody
	end)
end

local function processWidgetsResponseAndHydrate(p4, p5) --[[ line: 79 ]]
	-- upvalues: extractWidgetContent (ref), promiseModule (ref), hydrateWidgetContent (ref)
	local var10 = extractWidgetContent(p5)
	
	return if #var10 == 0 then promiseModule.resolve({
		hydrateResponseBody = nil,
		widgetListInfo = p5,
		widgetContent = var10
	}) else hydrateWidgetContent(p4, var10):andThen(function(p6) --[[ line: 90 ]]
		-- upvalues: p5 (ref), var10 (ref)
		return {
			widgetListInfo = p5,
			hydrateResponseBody = p6,
			widgetContent = var10
		}
	end)
end

local function _(p7) --[[ line: 99 | named "toGetWidgetListInfoRequestImpl" ]]
	return function(p8, p9) --[[ line: 100 ]]
		-- upvalues: p7 (ref)
		return p7(p8, p9)
	end
end

return {
	PROFILE_FRAMES_WIDGET_CONTEXT = "catalog-tab:profile-frames",
	buildHydrateUrl = buildHydrateUrl,
	extractWidgetContent = extractWidgetContent,
	fetchProfileFramesWidgets = function(p10, p11) --[[ line: 105 ]]
		-- upvalues: httpService (ref), getWidgetListInfo (ref), processWidgetsResponseAndHydrate (ref)
		return getWidgetListInfo(function(p13, p14) --[[ line: 100 ]]
			-- upvalues: p10 (ref)
			return p10(p13, p14)
		end, if p11 and p11.requestId then p11.requestId else httpService:GenerateGUID(false), "catalog-tab:profile-frames", nil):andThen(function(p12) --[[ line: 114 ]]
			-- upvalues: processWidgetsResponseAndHydrate (copy), p10 (ref)
			return processWidgetsResponseAndHydrate(p10, p12)
		end)
	end
}