import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_web/admin/data/order_data.dart';

class OrderDialog extends StatelessWidget {
  OrderDialog({Key? key}) : super(key: key);

  final orderController = Get.put(OrderData());

  @override
  Widget build(BuildContext context) {
    orderController.getOrder();
    return AlertDialog(
      content: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '거래내역',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "전문가 아이디",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "최종 가격",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "수수료",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "최종 날짜",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "결제 상태",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "결제 요청 날짜",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "예상 견적",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "견적 요청 일",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "사용자 아이디",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "사용자 이름",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width,
                child: Obx(
                  () => orderController.isLoading
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: orderController.order.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].pro_id,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].final_price,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].final_fee,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].final_date,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].status,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].register_date,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].estimate_price,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].estimate_date,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].user_id,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFcccccc))),
                                  child: Text(
                                    orderController.order[index].user_name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareR',
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                )),
                              ],
                            );
                          })
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
