local Parent = script:FindFirstAncestor("BuildExperience").Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise
local Text = require(Parent.Http).Url.THUMBNAILS_URL .. "v1/batch"

return function(AssetId, p1)
	-- upvalues: Debug (copy), PromiseModule (copy), FetchFunction (copy), Text (copy), AsPromiseFunction (copy)
	local P1 = p1 or "420x420"
	Debug.log("info", "thumbnail_url polling", { assetId = AssetId })
	
	return PromiseModule.new(function(Callback1, Callback)
		-- upvalues: FetchFunction (upval), Text (upval), AssetId (copy), P1 (copy), AsPromiseFunction (upval), Debug (upval)
		local Count = 0
		
		local function poll(p2)
			-- upvalues: FetchFunction (upval), Text (upval), AssetId (upval), P1 (upval), AsPromiseFunction (upval), Callback (copy), Debug (upval), Callback1 (copy), Count (ref), poll (copy)
			AsPromiseFunction((FetchFunction({
				method = "POST",
				analyticsKey = "build-experience.get-thumbnail-url",
				url = Text,
				body = {
					{
						type = "Asset",
						format = "Png",
						targetId = AssetId,
						size = P1
					}
				},
				decode = function(p3)
					return p3
				end
			}))):andThen(function(Result)
				-- upvalues: Callback (upval), Debug (upval), AssetId (upval), Callback1 (upval), Count (upval), poll (upval), p2 (copy)
				local Data = Result and Result.data
				
				if not Data or #Data == 0 then
					Callback("No thumbnail data returned")
					
					return
				end
				local Entry = Data[1]
				
				if Entry.state == "Completed" then
					Debug.log("info", "thumbnail_url completed", { assetId = AssetId })
					Callback1({ status = "completed", imageUrl = Entry.imageUrl })
					
					return
				end
				if Entry.state == "InReview" then
					Count += 1
					
					if Count >= 5 then
						Debug.log("warn", "thumbnail_url in_review timeout", { assetId = AssetId })
						Callback1({ status = "in_review", assetId = AssetId })
						
						return
					else
						task.delay(2, function()
							-- upvalues: poll (upval), p2 (upval)
							poll(p2 + 1)
						end)
						
						return
					end
				elseif Entry.state ~= "Pending" then
					Callback(`Thumbnail failed: {Entry.state}`)
					
					return
				else
					if p2 >= 15 then
						Debug.log("warn", "thumbnail_url timed out", { assetId = AssetId })
						Callback("Thumbnail generation timed out")
						
						return
					else
						task.delay(2, function()
							-- upvalues: poll (upval), p2 (upval)
							poll(p2 + 1)
						end)
					end
				end
			end):catch(function(Err)
				-- upvalues: Callback (upval)
				Callback(Err)
			end)
		end
		
		poll(1)
	end)
end