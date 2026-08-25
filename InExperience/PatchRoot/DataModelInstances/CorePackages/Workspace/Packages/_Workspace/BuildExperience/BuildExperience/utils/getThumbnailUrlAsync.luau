local parent = script:FindFirstAncestor("BuildExperience").Parent
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local debug = require(parent.DataHydration.CreatorAgentChat).debug
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p0, p1)
	-- upvalues: debug (ref), promiseModule (ref), fetch (ref), asPromise (ref)
	p1 = p1 or "420x420"
	debug.log("info", "thumbnail_url polling", { assetId = p0 })
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: fetch (copy), p0 (ref), p1 (ref), asPromise (copy), debug (copy)
		local var3 = 0
		
		local function poll(p4)
			-- upvalues: fetch (copy), p0 (copy), p1 (copy), asPromise (copy), p3 (ref), debug (copy), p2 (ref), var3 (write), poll (ref)
			asPromise(fetch({
				method = "POST",
				url = "https://thumbnails.roblox.com/v1/batch",
				analyticsKey = "build-experience.get-thumbnail-url",
				body = {
					{ type = "Asset", format = "Png", targetId = p0, size = p1 }
				},
				decode = function(p7)
					return p7
				end
			})):andThen(function(p6)
				-- upvalues: p3 (copy), debug (copy), p0 (copy), p2 (copy), var3 (copy), poll (copy), p4 (ref)
				local data = p6 and p6.data
				
				if not data or #data == 0 then
					p3("No thumbnail data returned")
					
					return
				end
				local var6 = data[1]
				
				if var6.state == "Completed" then
					debug.log("info", "thumbnail_url completed", { assetId = p0 })
					p2({ status = "completed", imageUrl = var6.imageUrl })
					
					return
				elseif var6.state == "InReview" then
					var3 += 1
					
					if var3 >= 5 then
						debug.log("warn", "thumbnail_url in_review timeout", { assetId = p0 })
						p2({ status = "in_review", assetId = p0 })
						
						return
					end
					task.delay(2, function()
						-- upvalues: poll (copy), p4 (copy)
						poll(p4 + 1)
					end)
					
					return
				elseif var6.state ~= "Pending" then
					p3(`Thumbnail failed: {var6.state}`)
					
					return
				elseif p4 >= 15 then
					debug.log("warn", "thumbnail_url timed out", { assetId = p0 })
					p3("Thumbnail generation timed out")
					
					return
				end
				task.delay(2, function()
					-- upvalues: poll (copy), p4 (copy)
					poll(p4 + 1)
				end)
			end):catch(function(p5)
				-- upvalues: p3 (copy)
				p3(p5)
			end)
		end
		
		poll(1)
	end)
end