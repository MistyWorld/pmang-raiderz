-- 닷소의 집(지하)	
function Field_1070542:OnSpawn(SpawnInfo)
	if (SpawnInfo.NPCID == 107237) then
		local Field = SpawnInfo.Field
		local Maid = SpawnInfo.NPC	
		Maid:Say("$$Field_1070542_6") -- 시집은 이 건너편 방에 있을거에요.
		Maid:NonDelaySay("$$Field_1070542_7") -- 오랫동안 관리를 안 해서 그런지 많이 지저분하네요.		
		Maid:Patrol({6,8,4,5}, PT_ONCE)		
		Maid:Say("$$Field_1070542_9") -- 꺄아! 이게 다 뭐야?!
		Maid:Say("$$Field_1070542_10") -- 어서 저 거미들 좀 어떻게 해봐요!
	end
	if (SpawnInfo.NPCID == 107004) then -- 어미거미
		SpawnInfo.NPC:SetAlwaysRun(true)
		SpawnInfo.NPC:MoveToMarker(15)
		SpawnInfo.NPC:MoveToMarker(14)
		SpawnInfo.NPC:MoveToMarker(13)
		SpawnInfo.NPC:MoveToMarker(12)	
	end
end

function Field_1070542:OnSensorEnter_1(Actor) -- 거미들 도망감
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()	
		if (AsPlayer(Actor):CheckCondition(1070542) == true) then
		--if (Field:GetNPCCount(107034) ~= 0) then
			AsPlayer(Actor):UpdateQuestVar(107054, 3)
			Field:DisableSensor(1)
			local SpiderTable = {14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34}
			local i = 1

			repeat 
				local Spiders = Field:GetSpawnNPC(SpiderTable[i])
					--GLog("실행:"..i.."회\n")
				Spiders:ClearJob()
				Spiders:SetAlwaysRun(true)
				Spiders:MoveToMarker(15)
				Spiders:Despawn()
				i = i + 1
			until i >= table.getn(SpiderTable)+1

			local Maid = Field:GetSpawnNPC(13)
			local Bookshelf = Field:GetSpawnNPC(11)
			Maid:Wait(3)
			Maid:Say("$$Field_1070542_43") -- 이제 됐네요.
			Maid:NonDelaySay("$$Field_1070542_44") -- 이 거미들은 깨진 창문 틈을 통해서 들어왔나 봐요.
			Maid:Patrol({9,10,11}, PT_ONCE)
			Maid:FaceTo(Actor)
			Maid:Say("$$Field_1070542_47") -- 바로 이곳이에요. 안 쓰는 책들을 옮겨놓은 곳이...
			Maid:FaceTo(Bookshelf)		
			Maid:Say("$$Field_1070542_49") -- 한번 저 책장을 조사해보세요.
			Field:EnableSensor(2)			
		end
	end
end

function Field_1070542:OnSensorEnter_2(Actor)
	if (Actor:IsPlayer() == true) then
		local Field = AsPlayer(Actor):GetField()
		Field:DisableSensor(2)			
		AsPlayer(Actor):UpdateQuestVar(107054, 4)
		Field:SpawnByID(10)  -- 어미거미 출현
	end
end

function Field_1070542:OnDie(DespawnInfo)
	local Field = DespawnInfo.Field
	if (DespawnInfo.NPCID == 107034) then
		--if (Field:GetNPCCount(107034) <= 17) then
			Field:EnableSensor(1)
		--end
	end
	if (DespawnInfo.NPCID == 107002) or (DespawnInfo.NPCID == 107002) then
		if (Field:GetNPCCount(107002) == 0) and (Field:GetNPCCount(107004) == 0) then
			local Maid = Field:GetSpawnNPC(13)
			Maid:FaceTo(DespawnInfo.NPC)
			Maid:Say("$$Field_1070542_75") -- 와~ 내 생전에 저렇게 큰 거미는 처음 봤어요." />
			Maid:Say("$$Field_1070542_76") -- 책을 찾았으면 어서 이 으스스한 곳에서 나가요. 더는 못 참겠어요.
		end
	end
end




