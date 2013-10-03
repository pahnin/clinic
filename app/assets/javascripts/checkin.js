app.init(function(){
  $('#mobile_number_check').on('click',function(){
    $('.mobile-error').html("");
    $('.account_details').html('');
    var val = $('.mobile_number').val();
    $.ajax({
      url: '/mobile_number_check/'+val,
    }).done(function(data){
      var customer_id = data["id"];
      if(data["present"]){
        $.ajax({
          url: '/customers/'+customer_id,
        }).done(function(data){
          $('.customer_details').html(data);
          app.initAccountSelectFire(customer_id);
        });
      }
      else{
        $('.mobile-error').html("No account found <a href='/customers/new/"+val+"'>Add new customer</a>");
      }
    });
  });


});

app.initAccountSelectFire = function(customer_id){
    $('.history').html("");
  var customer_id = customer_id;
  $('.accounts_select').on('change',function(e){
    var account_id = $(this).val();
    $.ajax({
      url: '/customers/'+customer_id+'/accounts/'+account_id
    }).done(function(data){
      $('.account_details').html(data);
      
      $('form.new_checkin').append("<input type='hidden' name='checkin[account_id]' value='"+account_id+"'>");
    });
    $.ajax({
      url: '/checkins/'+customer_id+'/history',
    }).done(function(data){
      $('.history').html(data);
    });
  });
}
