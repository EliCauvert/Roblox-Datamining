local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.Parent.AutocompleteTypes)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local _ = require(ChatUIPrimitives.createExpressionCatalogResource)
local EscapeRichTextModule = require(ChatUIPrimitives.Utils.escapeRichText)
local GetPresetIconRichTextModule = require(ChatUIPrimitives.universal.ContentKinds.Preset.getPresetIconRichText)
local MessageDraftFromExpressionContentModule = require(ChatUIPrimitives.universal.messageDraftFromExpressionContent)

local function _(p1)
	local MinQueryLength = if p1 == nil then nil else p1.minQueryLength
	
	return if type(MinQueryLength) == "number" and MinQueryLength > 0 then MinQueryLength else 2
end

local function getWordStartRank(Text: string, Pattern): number?
	local FoundAt: number? = string.find(Text, Pattern, 1, true)
	while FoundAt ~= nil do
		if FoundAt == 1 then
			return 1
		end
		if string.match(string.sub(Text, FoundAt - 1, FoundAt - 1), "%w") == nil then
			return 2
		end
		FoundAt = string.find(Text, Pattern, FoundAt + 1, true)
	end
	return nil
end

local _ = function(p1)
	local Content = p1.content
	
	return if Content.kind == "preset" then Content.text else nil
end

local function buildIndex(Catalog)
	if Catalog == nil or Catalog.status ~= "enabled" then
		return {}
	end
	local t = {}
	local List = {}
	local CatalogIndex = 0
	
	for _, categoryGroup in Catalog.categoryGroups do
		for _, category in categoryGroup.categories do
			for _, item in category.items do
				CatalogIndex += 1
				local Content = item.content
				local Text = if Content.kind == "preset" then Content.text else nil
				
				if Text ~= nil and Text ~= "" and t[Text] ~= true then
					t[Text] = true
					table.insert(List, {
						expressionItem = item,
						catalogIndex = CatalogIndex,
						lowerText = string.lower(Text)
					})
				end
			end
		end
	end
	return List
end

local _ = function(p1)
	local Content = p1.expressionItem.content
	local Text = if Content.kind == "preset" then Content.text else nil
	
	return if Text == nil then "" else Text
end

local function selectPreset(p1)
	-- upvalues: MessageDraftFromExpressionContentModule (copy)
	local MessageDraftFromExpressionContentModuleResult = MessageDraftFromExpressionContentModule(p1.expressionItem.content)
	
	return if MessageDraftFromExpressionContentModuleResult == nil then nil else {
		kind = "sendDraft",
		draft = MessageDraftFromExpressionContentModuleResult
	}
end

local function PresetAutocompleteEntry(p1)
	-- upvalues: FoundationModule (copy), GetPresetIconRichTextModule (copy), ReactModule (copy), EscapeRichTextModule (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center size-full" }, {
		label = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-body-medium content-emphasis",
			RichText = true,
			LayoutOrder = 1,
			Text = `{EscapeRichTextModule(p1.text)} {GetPresetIconRichTextModule(FoundationModule.Hooks.useTokens().Typography.BodyMedium.FontSize)}`
		})
	})
end

local function renderPresetEntry(p1, _)
	-- upvalues: ReactModule (copy), PresetAutocompleteEntry (copy)
	local Content = p1.expressionItem.content
	local Text = if Content.kind == "preset" then Content.text else nil
	
	return ReactModule.createElement(PresetAutocompleteEntry, { text = if Text == nil then "" else Text })
end

return function(p1)
	-- upvalues: buildIndex (copy), getWordStartRank (copy), SignalsModule (copy), selectPreset (copy), renderPresetEntry (copy)
	assert(type(p1.id) == "string" and p1.id ~= "", "AutocompleteSources.presetChat requires an id")
	assert(type(p1.catalogResource) == "table", "AutocompleteSources.presetChat requires a catalogResource")
	assert(type(p1.getIsAvailable) == "function", "AutocompleteSources.presetChat requires getIsAvailable")
	local CatalogResource = p1.catalogResource
	local GetIsAvailableFunction = p1.getIsAvailable
	local SearchVariant = p1.searchVariant
	local MinQueryLength = if SearchVariant == nil then nil else SearchVariant.minQueryLength
	local MinQueryLength1 = if type(MinQueryLength) == "number" and MinQueryLength > 0 then MinQueryLength else 2
	local v1 = false
	local Flag = false
	local Catalog = nil
	local t = {}
	
	local function _(p2)
		-- upvalues: Flag (ref), Catalog (ref), t (ref), buildIndex (upval)
		if not Flag or Catalog ~= p2 then
			Flag = true
			Catalog = p2
			t = buildIndex(p2)
			
			return
		end
	end
	
	return {
		id = p1.id,
		matchTrigger = function(Text, p2)
			-- upvalues: MinQueryLength1 (copy)
			local Length = utf8.len(Text)
			
			return if Length == nil or p2 ~= Length + 1 or Length < MinQueryLength1 then nil else { replaceStart = 1, query = Text, replaceFinish = Length }
		end,
		search = function(Text: string)
			-- upvalues: v1 (ref), t (ref), getWordStartRank (upval)
			if not v1 then
				return {}
			end
			local Lowered = string.lower(Text)
			local List = {}
			
			for _, Entry in t do
				local WordStartRank = getWordStartRank(Entry.lowerText, Lowered)
				
				if WordStartRank ~= nil then
					table.insert(List, { rank = WordStartRank, entry = Entry })
				end
			end
			table.sort(List, function(A, B): boolean
				return if A.rank == B.rank then A.entry.catalogIndex < B.entry.catalogIndex else A.rank < B.rank
			end)
			local Buffer = table.create(#List)
			
			for _, value in List do
				table.insert(Buffer, {
					expressionItem = value.entry.expressionItem,
					catalogIndex = value.entry.catalogIndex
				})
			end
			return Buffer
		end,
		select = selectPreset,
		renderEntry = renderPresetEntry,
		maxResults = p1.maxResults,
		subscribe = function(Callback)
			-- upvalues: CatalogResource (copy), SignalsModule (upval), v1 (ref), GetIsAvailableFunction (copy), Flag (ref), Catalog (ref), t (ref), buildIndex (upval)
			CatalogResource.acquire()
			local Flag1 = false
			local Flag2 = false
			local Effect = SignalsModule.createEffect(function(p2)
				-- upvalues: v1 (upval), GetIsAvailableFunction (upval), CatalogResource (upval), Flag (upval), Catalog (upval), t (upval), buildIndex (upval), Flag1 (ref), Flag2 (ref), Callback (copy)
				v1 = GetIsAvailableFunction(p2) == true
				local Catalog1 = CatalogResource.getCatalog(p2)
				
				if not Flag or Catalog ~= Catalog1 then
					Flag = true
					Catalog = Catalog1
					t = buildIndex(Catalog1)
				end
				if Flag1 or not Flag2 then
					Flag2 = true
					
					return
				else
					Callback()
				end
			end)
			
			return function()
				-- upvalues: Flag1 (ref), Effect (copy), CatalogResource (upval)
				Flag1 = true
				Effect()
				CatalogResource.release()
			end
		end
	}
end