local Http = script:FindFirstAncestor("Http")
local Parent = Http.Parent
local Thumbnail = require(Http.Models).Thumbnail
local PerformFetchModule = require(Http.PerformFetch)
local ArgCheckModule = require(Parent.ArgCheck)
local PromiseModule = require(Parent.Promise)
local ResultModule = require(Parent.Result)
local TutilsModule = require(Parent.tutils)
local Largest = math.max(0, tonumber(settings():GetFVariable("LuaAppNonFinalThumbnailMaxRetries")) or 0)
local Largest1 = math.max(0, tonumber(settings():GetFVariable("LuaAppThumbnailsApiRetryTimeMultiplier")) or 0)
local FetchSubdividedThumbnailsModule = {
	_fetchIcons = function(p1, p2, p3, IconSize, Callback1, RequestName, Callback, Callback2)
		-- upvalues: ResultModule (copy), Thumbnail (copy), PromiseModule (copy)
		local function _(TargetId)
			-- upvalues: Callback1 (copy), RequestName (copy), IconSize (copy)
			return Callback1({
				targetId = TargetId,
				requestName = RequestName,
				iconSize = IconSize
			})
		end
		
		local function getTableOfFailedResults(List)
			-- upvalues: Callback1 (copy), RequestName (copy), IconSize (copy), ResultModule (upval)
			local NewResults = {}
			
			for _, TargetId in pairs(List) do
				NewResults[Callback1({
					targetId = TargetId,
					requestName = RequestName,
					iconSize = IconSize
				})] = ResultModule.new(false, { targetId = TargetId })
			end
			return NewResults
		end
		
		return Callback(p2, p3, IconSize):andThen(function(Result)
			-- upvalues: getTableOfFailedResults (copy), p3 (copy), Thumbnail (upval), IconSize (copy), Callback1 (copy), RequestName (copy), ResultModule (upval), p1 (copy), Callback2 (copy), PromiseModule (upval)
			local TableOfFailedResults = getTableOfFailedResults(p3)
			local FromThumbnailDataResults = {}
			local Data = Result and (Result.responseBody and Result.responseBody.data)
			
			if typeof(Data) == "table" then
				for _, entry in pairs(Data) do
					if Thumbnail.isCompleteThumbnailData(entry) then
						local Text = tostring(entry.targetId)
						local Flag = false
						
						if Thumbnail.checkStateIsFinal(entry.state) then
							FromThumbnailDataResults[Text] = Thumbnail.fromThumbnailData(entry, IconSize)
							Flag = true
						end
						TableOfFailedResults[Callback1({
							targetId = Text,
							requestName = RequestName,
							iconSize = IconSize
						})] = ResultModule.new(Flag, entry)
					end
				end
			end
			p1:dispatch(Callback2(FromThumbnailDataResults))
			
			return PromiseModule.resolve(TableOfFailedResults)
		end, function(_)
			-- upvalues: getTableOfFailedResults (copy), p3 (copy), PromiseModule (upval)
			return PromiseModule.resolve((getTableOfFailedResults(p3)))
		end)
	end
}

function FetchSubdividedThumbnailsModule._fetch(p4, p5, p6, IconSize, KeyMapper, RequestName, p7, p8)
	-- upvalues: FetchSubdividedThumbnailsModule (copy), Largest (ref), Largest1 (ref), Thumbnail (copy), TutilsModule (copy), PromiseModule (copy)
	return FetchSubdividedThumbnailsModule._fetchIcons(p4, p5, p6, IconSize, KeyMapper, RequestName, p7, p8):andThen(function(Result)
		-- upvalues: Largest (upval), Largest1 (upval), Thumbnail (upval), TutilsModule (upval), PromiseModule (upval), FetchSubdividedThumbnailsModule (upval), p4 (copy), p5 (copy), p6 (copy), IconSize (copy), KeyMapper (copy), RequestName (copy), p7 (copy), p8 (copy)
		local t = {}
		local Result1 = Result
		
		if _G.__TESTEZ_RUNNING_TEST__ then
			Largest = 1
			Largest1 = 0.001
		end
		local function retry(Largest)
			-- upvalues: Result1 (ref), Thumbnail (upval), t (copy), TutilsModule (upval), PromiseModule (upval), Largest1 (upval), FetchSubdividedThumbnailsModule (upval), p4 (upval), p5 (upval), p6 (upval), IconSize (upval), KeyMapper (upval), RequestName (upval), p7 (upval), p8 (upval), retry (copy)
			local List = {}
			
			for i, value in pairs(Result1) do
				local UnwrapResult, UnwrapResult2 = value:unwrap()
				
				if UnwrapResult and Thumbnail.checkStateIsFinal(UnwrapResult2.state) then
					t[i] = value
				else
					table.insert(List, UnwrapResult2)
				end
			end
			return if TutilsModule.fieldCount(List) == 0 then PromiseModule.resolve(t) else PromiseModule.new(function(Callback, _)
				-- upvalues: Largest1 (upval), Largest (copy)
				coroutine.wrap(function()
					-- upvalues: Largest1 (upval), Largest (upval), Callback (copy)
					wait(Largest1 * math.pow(2, Largest - 1))
					Callback()
				end)()
			end):andThen(function()
				-- upvalues: FetchSubdividedThumbnailsModule (upval), p4 (upval), p5 (upval), p6 (upval), IconSize (upval), KeyMapper (upval), RequestName (upval), p7 (upval), p8 (upval)
				return FetchSubdividedThumbnailsModule._fetchIcons(p4, p5, p6, IconSize, KeyMapper, RequestName, p7, p8)
			end):andThen(function(Result)
				-- upvalues: Result1 (upval), Largest (copy), retry (upval), PromiseModule (upval), t (upval)
				Result1 = Result
				
				return if Largest > 1 then retry(Largest - 1) else PromiseModule.resolve(t)
			end)
		end
		
		return retry(Largest)
	end)
end

function FetchSubdividedThumbnailsModule.Fetch(p9, p10, KeyMapper, RequestName, p11, p12)
	-- upvalues: ArgCheckModule (copy), FetchSubdividedThumbnailsModule (copy), PerformFetchModule (copy)
	ArgCheckModule.isType(p10, "table", "requests")
	ArgCheckModule.isType(RequestName, "string", "requestName")
	ArgCheckModule.isNonNegativeNumber(#p10, "requests count")
	FetchSubdividedThumbnailsModule.KeyMapper = KeyMapper
	
	return PerformFetchModule.Batch(p10, KeyMapper, function(p13, List)
		-- upvalues: FetchSubdividedThumbnailsModule (upval), p9 (copy), KeyMapper (copy), RequestName (copy), p11 (copy), p12 (copy)
		local List1 = {}
		local IconSize = nil
		
		for _, value in ipairs(List) do
			IconSize = value.iconSize
			table.insert(List1, value.targetId)
		end
		return FetchSubdividedThumbnailsModule._fetch(p13, p9, List1, IconSize, KeyMapper, RequestName, p11, p12)
	end)
end

return FetchSubdividedThumbnailsModule