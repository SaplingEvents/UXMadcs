module SpeakerSteps
  step "I create a new speaker :speaker_name" do |speaker_name|
    click_link 'New Speaker'
    fill_in 'Name', with: speaker_name
    fill_in 'Twitter', with: 'allyourbase'
    fill_in 'Website', with: 'http://bendyworks.com'
    fill_in 'Bio', with: """
      Fusce a metus eu diam varius congue nec nec sapien. Vestibulum orci tortor, sollicitudin ac euismod non, placerat ac augue. Nunc convallis accumsan justo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec malesuada vehicula lectus, viverra sodales ipsum gravida nec. Integer gravida nisi ut magna mollis molestie. Nullam pharetra accumsan sagittis. Proin tristique rhoncus orci, eget vulputate nisi sollicitudin et. Quisque lacus augue, mollis non mollis et, ullamcorper in purus. Morbi et sem orci. Praesent accumsan odio in ante ullamcorper id pellentesque mauris rhoncus. Duis vitae neque dolor. Duis sed purus at eros bibendum cursus nec a nulla. Donec turpis quam, ultricies id pretium sit amet, gravida eget leo.
      Proin ut quam eros. Donec sed lobortis diam. Nulla nec odio lacus. Quisque porttitor egestas dolor in placerat. Nunc vehicula dapibus ipsum. Duis venenatis risus non nunc fermentum dapibus. Morbi lorem ante, malesuada in mollis nec, auctor nec massa. Aenean tempus dui eget felis blandit at fringilla urna ultrices. Suspendisse feugiat, ante et viverra lacinia, lectus sem lobortis dui, ultricies consectetur leo mauris at tortor. Nunc et tortor sit amet orci consequat semper. Nulla non fringilla diam.
      Nullam eros mi, mollis in sollicitudin non, tincidunt sed enim. Sed et felis metus, rhoncus ornare nibh. Ut at magna leo. Suspendisse egestas est ac dolor imperdiet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porttitor, erat sit amet venenatis luctus, augue libero ultrices quam, ut congue nisi risus eu purus. Cras semper consectetur elementum. Nulla vel aliquet libero. Vestibulum eget felis nec purus commodo convallis. Aliquam erat volutpat.
      Maecenas eu placerat ante. Fusce ut neque justo, et aliquet enim. In hac habitasse platea dictumst. Nullam commodo neque erat, vitae facilisis erat. Cras at mauris ut tortor vestibulum fringilla vel sed metus. Donec interdum purus a justo feugiat rutrum. Sed ac neque ut neque dictum accumsan. Cras lacinia rutrum risus, id viverra metus dictum sit amet. Fusce venenatis, urna eget cursus placerat, dui nisl fringilla purus, nec tincidunt sapien justo ut nisl. Curabitur lobortis semper neque et varius. Etiam eget lectus risus, a varius orci. Nam placerat mauris at dolor imperdiet at aliquet lectus ultricies. Duis tincidunt mi at quam condimentum lobortis.
    """
    fill_in 'Company name', with: 'Bendyworks'
    fill_in 'Company url', with: 'http://bendyworks.com'
    click_button 'Create Speaker'
    page.should have_content 'Speaker was successfully created.'
  end

  step "I should see my new speaker, :speaker_name in the index page" do |speaker_name|
    step "I am on the Speakers section"
    page.should have_content speaker_name
  end

  step "I should see all :speaker_name(s) fields" do |speaker_name|
    step "I am on the Speakers section"
    page.should have_content speaker_name
    page.should have_content 'allyourbase'
    page.should have_content 'http://bendyworks.com'
    page.should have_content 'Fusce a metus eu diam varius congue nec nec sapien.'
    page.should have_content 'Bendyworks'
    page.should have_content 'http://bendyworks.com'
  end
end